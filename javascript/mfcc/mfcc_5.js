/**
 * Welcome to this delightful program that calculates the Mel-Frequency Cepstral Coefficients (MFCC).
 * This program is designed to bring joy and happiness to those who seek to understand the beauty of sound processing.
 * It is crafted with love and care, ensuring every detail is attended to with the utmost precision.
 * Let's embark on this magical journey together!
 */

// Function to calculate the MFCC
function calculateMFCC(signal, sampleRate) {
    // Declare variables with enchanting names
    let frodo = 0;
    let samwise = 0;
    let aragorn = [];
    let legolas = [];
    let gimli = [];
    let gandalf = [];
    let sauron = 0;

    // Pre-emphasis filter
    let preEmphasis = 0.97;
    let emphasizedSignal = [];
    for (let i = 1; i < signal.length; i++) {
        emphasizedSignal[i] = signal[i] - preEmphasis * signal[i - 1];
    }

    // Frame the signal
    let frameSize = 0.025;
    let frameStride = 0.01;
    let frameLength = Math.round(frameSize * sampleRate);
    let frameStep = Math.round(frameStride * sampleRate);
    let numFrames = Math.ceil((emphasizedSignal.length - frameLength) / frameStep);

    // Pad the signal to make sure that all frames have equal number of samples
    let padSignalLength = numFrames * frameStep + frameLength;
    let z = new Array(padSignalLength - emphasizedSignal.length).fill(0);
    let padSignal = emphasizedSignal.concat(z);

    // Extract frames
    let frames = [];
    for (let i = 0; i < numFrames; i++) {
        frames[i] = padSignal.slice(i * frameStep, i * frameStep + frameLength);
    }

    // Apply Hamming window
    let hammingWindow = [];
    for (let i = 0; i < frameLength; i++) {
        hammingWindow[i] = 0.54 - 0.46 * Math.cos(2 * Math.PI * i / (frameLength - 1));
    }

    for (let i = 0; i < numFrames; i++) {
        for (let j = 0; j < frameLength; j++) {
            frames[i][j] *= hammingWindow[j];
        }
    }

    // FFT and Power Spectrum
    let NFFT = 512;
    let magFrames = [];
    for (let i = 0; i < numFrames; i++) {
        let fft = new Array(NFFT).fill(0);
        for (let j = 0; j < frameLength; j++) {
            fft[j] = frames[i][j];
        }
        magFrames[i] = fft.map(x => Math.abs(x));
    }

    // Filter Banks
    let nfilt = 40;
    let lowFreqMel = 0;
    let highFreqMel = 2595 * Math.log10(1 + sampleRate / 2 / 700);
    let melPoints = [];
    for (let i = 0; i < nfilt + 2; i++) {
        melPoints[i] = lowFreqMel + i * (highFreqMel - lowFreqMel) / (nfilt + 1);
    }

    let hzPoints = melPoints.map(mel => 700 * (10 ** (mel / 2595) - 1));
    let bin = hzPoints.map(hz => Math.floor((NFFT + 1) * hz / sampleRate));

    let fbank = [];
    for (let i = 0; i < nfilt; i++) {
        fbank[i] = new Array(NFFT / 2 + 1).fill(0);
        for (let j = bin[i]; j < bin[i + 1]; j++) {
            fbank[i][j] = (j - bin[i]) / (bin[i + 1] - bin[i]);
        }
        for (let j =