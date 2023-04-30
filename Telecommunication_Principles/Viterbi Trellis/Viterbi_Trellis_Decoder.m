%% Assignment 2 Telecommunication Principles: Telecommunication Toolbox
% Student ID: a1798086
% Name: Brian Wang
% Created on: 03/10/2022
% Last Modified: 24/10/2022

% This code explores the Viterbi trellis decoder across a range of Signal 
% to Noise ratios, using hard, quantised, and soft decoding.

% parameters
s = 10;
SNR = zeros(1,s);

% Initialisation of BER results as arrays of 0s.
BERCODEDSOFT = zeros(1,s);
BERCODEDHARD = zeros(1,s);
BERCODEDQUANT = zeros(1,s);
BERCODEDRAW = zeros(1,s);

% Iterate through all SNRs
for i=1:10
    trellis = poly2trellis(7,[171 133]);
        
    K = log2(trellis.numInputSymbols); % Number of input bit streams
    N = log2(trellis.numOutputSymbols); % Number of output bit streams
    coderate = K/N;
    
    fprintf('K is %d and N is %d. The code rate is %3.2f.\n', ...
        K,N,coderate);
    
    M = 64; % Modulation order
    bps = log2(M); % Bits per modulation symbol
    numSymPerFrame = 1000; % symbols per frame
    dataIn = randi([0 1],bps*numSymPerFrame,1); % creating baseband
    codedout = convenc(dataIn,trellis);
    
    txSig = qammod(codedout,M,InputType='bit',UnitAveragePower=true);
    
    
    % SNR calculations
    EbNo = 1;
    snr = EbNo + i + 10*log10(bps*coderate);
    noiseVar = 10.^(-snr/10);
    rxSig = awgn(txSig,snr,'measured'); % addition of white guassian noise.
    
    tbl = 32;
    
    % demodulation process
    demodSig = qamdemod(rxSig,M,OutputType='bit',UnitAveragePower=true);
    dataHard = vitdec(demodSig,trellis,tbl,'cont','hard');
          
    % Hard decoding
    berCoded = biterr( ...
        dataIn(1:end-tbl),dataHard(tbl+1:end)) / ...
         length(dataHard(tbl+1:end));

    % Raw data
    berUncoded = berawgn(EbNo,'qam',M);
    fprintf('The coded BER is %6.5f.\nThe uncoded BER is %6.5f.\n', ...
        berCoded,berUncoded);

    SNR(i) = snr;
    BERCODEDHARD(i) = berCoded;
    BERCODEDRAW(i) = berUncoded;
    
    % Unquantized
    demodSigQuant = qamdemod(rxSig,M, OutputType='approxllr', UnitAveragePower=true, NoiseVariance=noiseVar);
    dataQuant = vitdec(demodSigQuant,trellis,tbl,'cont','unquant');
    berCoded3 = biterr( ...
        dataIn(1:end-tbl),dataQuant(tbl+1:end)) / ...
         length(dataQuant(tbl+1:end));

    BERCODEDQUANT(i) = berCoded3;


    % Soft
    demodSig2 = qamdemod(rxSig,M,OutputType='approxllr',UnitAveragePower=true,NoiseVariance=noiseVar);
    [x,qcode] = quantiz(demodSig2,[-.75 -.5 -.25 0 .25 .5 .75], [7 6 5 4 3 2 1 0]); % Values in qcode are between 0 and 2^3-1.
    dataSoft = vitdec(qcode',trellis,tbl,'cont','soft',3);

    berCoded2 = biterr( ...
        dataIn(1:end-tbl),dataSoft(tbl+1:end)) / ...
         length(dataSoft(tbl+1:end));

    BERCODEDSOFT(i) = berCoded2;

end
hold on;
figure(1);

% Scatter plots and labels
scatter(SNR, BERCODEDSOFT, 'filled', 'r');
set(gca,'yscale','log');
scatter(SNR, BERCODEDHARD, 'filled', 'b');
scatter(SNR, BERCODEDRAW, 'filled', 'g');
scatter(SNR, BERCODEDQUANT, 'filled', 'y');

legend("Soft","Hard","Raw (Uncoded)","Unquantised-Soft");
xlabel("SNR (dB)");
ylabel("BER (Logarithmic scale)");
% scatter(SNR, BERCODEDSOFT);
title("Different Decoding Methods plotted via SNR against BER");
hold off;