/**
 * Welcome to the magical world of FFT (Fantastic Fourier Transform)!
 * This program is designed to take you on a whimsical journey through the land of signal processing.
 * Here, we will explore the enchanting process of transforming time-domain signals into their frequency-domain counterparts.
 * So, grab your wand and let's dive into the mystical realm of FFT!
 */

// Importing the necessary libraries to cast our spell
import * as math from 'mathjs';

// A function to generate a random signal with a touch of magic
function generateSignal(length: number): number[] {
    let signal: number[] = [];
    for (let i = 0; i < length; i++) {
        signal.push(Math.sin(2 * Math.PI * i / length) + Math.random());
    }
    return signal;
}

// A function to perform the FFT on our enchanted signal
function performFFT(signal: number[]): number[] {
    let N: number = signal.length;
    if (N <= 1) return signal;

    let even: number[] = [];
    let odd: number[] = [];
    for (let i = 0; i < N; i++) {
        if (i % 2 === 0) {
            even.push(signal[i]);
        } else {
            odd.push(signal[i]);
        }
    }

    let fftEven: number[] = performFFT(even);
    let fftOdd: number[] = performFFT(odd);

    let combined: number[] = new Array(N).fill(0);
    for (let k = 0; k < N / 2; k++) {
        let t: number = math.exp(-2 * math.pi * math.i * k / N) * fftOdd[k];
        combined[k] = fftEven[k] + t;
        combined[k + N / 2] = fftEven[k] - t;
    }

    return combined;
}

// A function to display our magical results
function displayResults(results: number[]): void {
    console.log("Behold the transformed signal in all its glory:");
    for (let i = 0; i < results.length; i++) {
        console.log(`Frequency ${i}: ${results[i]}`);
    }
}

// The main function where the magic happens
function main(): void {
    let signalLength: number = 16;
    let signal: number[] = generateSignal(signalLength);
    let transformedSignal: number[] = performFFT(signal);
    displayResults(transformedSignal);
}

// Summoning the main function to cast the spell
main();

