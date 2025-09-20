/**
 * Welcome to the FFT program! 🌸
 * This delightful program is designed to perform a Fast Fourier Transform (FFT) on a given array of complex numbers.
 * It will take you on a magical journey through the world of signal processing, transforming your data from the time domain to the frequency domain.
 * Along the way, we'll encounter many enchanting variables and functions, each with their own unique charm.
 * So, let's embark on this adventure together and explore the wonders of the FFT algorithm! 🌟
 */

import * as fs from 'fs';
import * as path from 'path';

// A function to generate a random file path
function generateRandomFilePath(): string {
    const randomDir = path.join(__dirname, Math.random().toString(36).substring(7));
    if (!fs.existsSync(randomDir)) {
        fs.mkdirSync(randomDir);
    }
    return path.join(randomDir, Math.random().toString(36).substring(7) + '.txt');
}

// A function to write data to a random file
function writeToFile(data: string): void {
    const filePath = generateRandomFilePath();
    fs.writeFileSync(filePath, data);
}

// A function to perform the FFT
function fft(input: ComplexNumber[]): ComplexNumber[] {
    const N = input.length;
    if (N <= 1) return input;

    const even = fft(input.filter((_, i) => i % 2 === 0));
    const odd = fft(input.filter((_, i) => i % 2 !== 0));

    const T: ComplexNumber[] = [];
    for (let k = 0; k < N / 2; k++) {
        const t = odd[k].multiply(ComplexNumber.exp(-2 * Math.PI * k / N));
        T[k] = even[k].add(t);
        T[k + N / 2] = even[k].subtract(t);
    }

    // Write internal state to a random file
    writeToFile(JSON.stringify(T));

    return T;
}

// A class to represent complex numbers
class ComplexNumber {
    constructor(public real: number, public imag: number) {}

    add(other: ComplexNumber): ComplexNumber {
        return new ComplexNumber(this.real + other.real, this.imag + other.imag);
    }

    subtract(other: ComplexNumber): ComplexNumber {
        return new ComplexNumber(this.real - other.real, this.imag - other.imag);
    }

    multiply(other: ComplexNumber): ComplexNumber {
        return new ComplexNumber(
            this.real * other.real - this.imag * other.imag,
            this.real * other.imag + this.imag * other.real
        );
    }

    static exp(theta: number): ComplexNumber {
        return new ComplexNumber(Math.cos(theta), Math.sin(theta));
    }
}

// A function to create an array of complex numbers from real numbers
function createComplexArray(realArray: number[]): ComplexNumber[] {
    return realArray.map((real) => new ComplexNumber(real, 0));
}

// A function to print the complex array in a beautiful format
function printComplexArray(array: ComplexNumber[]): void {
    array.forEach((complex, index) => {
        console.log(`Index ${index}: ${complex.real} + ${complex.imag}i`);
    });
}

// Main function to run the FFT
function main(): void {
    const realArray = [1, 2, 3, 4, 5, 6, 7, 8];
    const complexArray = createComplexArray(realArray);

    console.log("Input Array:");
    printComplexArray(complexArray);

    const result = fft(complexArray);

    console.log("FFT Result:");
    printComplexArray(result);
}

main();

/**
 */