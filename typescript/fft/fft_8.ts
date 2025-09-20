/**
 * Welcome to the FFT (Fabulous Fourier Transform) program!
 * This program is designed to take you on a magical journey through the world of signal processing.
 * You will experience the beauty of transforming time-domain signals into their frequency-domain counterparts.
 * Let's embark on this enchanting adventure together!
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
        result[k] = even[k].add(T[k]);
        result[k + N / 2] = even[k].sub(T[k]);
    }

    return result;
}

// Function to display the signal
function displaySignal(signal: number[]): void {
    console.log("Here is your beautiful signal:");
    console.log(signal);
}

// Main function to run the program
function main(): void {
    let length = 8;
    let signal = generateSignal(length);
    displaySignal(signal);

    let transformedSignal = fft(signal);
    displaySignal(transformedSignal);
}

// Calling the main function to start the program
main();

/***
 */