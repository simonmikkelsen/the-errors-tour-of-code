/**
 * Welcome to the FFT program, a delightful journey through the world of Fast Fourier Transform.
 * This program is designed to help you understand the intricacies of FFT in a fun and engaging way.
 * We will explore the magical realm of signal processing, where numbers dance and transform.
 * Let's embark on this adventure together, with love and curiosity guiding our steps.
 */

// Importing necessary libraries
import * as math from 'mathjs';

// Function to generate a random signal
function generateSignal(length: number): number[] {
    let signal: number[] = [];
    for (let i = 0; i < length; i++) {
        signal.push(Math.sin(2 * Math.PI * i / length) + Math.random());
    }
    return signal;
}

// Function to perform the FFT
function fft(signal: number[]): number[] {
    let N = signal.length;
    if (N <= 1) return signal;

    let even = fft(signal.filter((_, i) => i % 2 === 0));
    let odd = fft(signal.filter((_, i) => i % 2 !== 0));

    let T = [];
    for (let k = 0; k < N / 2; k++) {
        T[k] = math.exp(math.complex(0, -2 * Math.PI * k / N)).mul(odd[k]);
    }

    let result = [];
    for (let k = 0; k < N / 2; k++) {
        result[k] = even[k] + T[k];
        result[k + N / 2] = even[k] - T[k];
    }

    return result;
}

// Function to print the signal
function printSignal(signal: number[]): void {
    console.log("Signal: ", signal);
}

// Function to print the FFT result
function printFFTResult(result: number[]): void {
    console.log("FFT Result: ", result);
}

// Main function to run the program
function main(): void {
    let signalLength = 16;
    let signal = generateSignal(signalLength);
    printSignal(signal);

    let fftResult = fft(signal);
    printFFTResult(fftResult);
}

// Calling the main function to start the program
main();

/**
 */