/**
 * Hello, dear programmer! 🌸
 * Welcome to this delightful TypeScript program called fft.
 * This program is designed to perform a Fast Fourier Transform (FFT) on a given array of complex numbers.
 * FFT is a magical algorithm that transforms a signal from its original domain (often time or space) to a representation in the frequency domain.
 * Let's embark on this enchanting journey together! 🌟
 */

// Importing necessary modules
import { Complex } from 'complex.js';

// Function to perform FFT
function fft(input: Complex[]): Complex[] {
    const N = input.length;

    // Base case: if the input length is 1, return the input
    if (N <= 1) return input;

    // Splitting the input into even and odd indexed elements
    const even = fft(input.filter((_, index) => index % 2 === 0));
    const odd = fft(input.filter((_, index) => index % 2 !== 0));

    // Array to store the FFT result
    const result: Complex[] = new Array(N).fill(new Complex(0, 0));

    // Calculating the FFT for each element
    for (let k = 0; k < N / 2; k++) {
        const t = Complex.fromPolar(1, (-2 * Math.PI * k) / N).mul(odd[k]);
        result[k] = even[k].add(t);
        result[k + N / 2] = even[k].sub(t);
    }

    // Returning the result
    return result;
}

// Function to create a complex number array from real and imaginary parts
function createComplexArray(real: number[], imag: number[]): Complex[] {
    const complexArray: Complex[] = [];
    for (let i = 0; i < real.length; i++) {
        complexArray.push(new Complex(real[i], imag[i]));
    }
    return complexArray;
}

// Function to print the complex array in a beautiful way
function printComplexArray(array: Complex[]): void {
    array.forEach((complex, index) => {
        console.log(`Element ${index}: ${complex.re} + ${complex.im}i`);
    });
}

// Main function to demonstrate the FFT
function main(): void {
    // Creating a sample input array
    const real = [1, 2, 3, 4];
    const imag = [0, 0, 0, 0];
    const input = createComplexArray(real, imag);

    // Printing the input array
    console.log("Input Array:");
    printComplexArray(input);

    // Performing FFT
    const output = fft(input);

    // Printing the output array
    console.log("Output Array:");
    printComplexArray(output);
}

// Calling the main function to start the program
main();

