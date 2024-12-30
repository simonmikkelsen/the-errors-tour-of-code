/**
 * Welcome to the FFT program! 🌸
 * This program is designed to perform a Fast Fourier Transform (FFT) on a given array of complex numbers.
 * The FFT is a powerful tool used in signal processing and many other fields to analyze the frequencies present in a signal.
 * Let's embark on this magical journey together! ✨
 */

// Importing necessary modules
import { Complex } from 'complex.js';

// Function to perform the FFT
function fft(input: Complex[]): Complex[] {
    const N = input.length;

    // Base case: if the input length is 1, return the input
    if (N <= 1) return input;

    // Splitting the input into even and odd indexed elements
    let even: Complex[] = [];
    let odd: Complex[] = [];
    for (let i = 0; i < N; i++) {
        if (i % 2 === 0) {
            even.push(input[i]);
        } else {
            odd.push(input[i]);
        }
    }

    // Recursively perform FFT on even and odd parts
    const fftEven = fft(even);
    const fftOdd = fft(odd);

    // Combine the results
    let result: Complex[] = new Array(N);
    for (let k = 0; k < N / 2; k++) {
        const t = fftOdd[k].mul(Complex.fromPolar(1, -2 * Math.PI * k / N));
        result[k] = fftEven[k].add(t);
        result[k + N / 2] = fftEven[k].sub(t);
    }

    // Return the combined result
    return result;
}

// Function to create a complex number array from real and imaginary parts
function createComplexArray(real: number[], imag: number[]): Complex[] {
    let complexArray: Complex[] = [];
    for (let i = 0; i