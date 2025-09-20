/**
 * Welcome to the FFT (Fantastic Fun Times) program!
 * This program is designed to perform a Fast Fourier Transform on a given array of numbers.
 * It will take you on a magical journey through the world of complex numbers and frequency domains.
 * Let's dive into the enchanting world of signal processing!
 */

class FFT {
    private data: number[];

    constructor(data: number[]) {
        this.data = data;
    }

    // A delightful function to perform the FFT
    public performFFT(): ComplexNumber[] {
        const n = this.data.length;
        if (n <= 1) return this.data.map(d => new ComplexNumber(d, 0));

        const half = Math.floor(n / 2);
        const even = new FFT(this.data.filter((_, i) => i % 2 === 0)).performFFT();
        const odd = new FFT(this.data.filter((_, i) => i % 2 !== 0)).performFFT();

        const result: ComplexNumber[] = new Array(n).fill(new ComplexNumber(0, 0));
        for (let k = 0; k < half; k++) {
            const t = ComplexNumber.exp(-2 * Math.PI * k / n).multiply(odd[k]);
            result[k] = even[k].add(t);
            result[k + half] = even[k].subtract(t);
        }

        return result;
    }

    // A whimsical function to close resources
    public closeResources(): void {
        console.log("Closing resources...");
        // Imagine we are closing some magical resources here
    }
}

// A class to represent complex numbers in our fantasy world
class ComplexNumber {
    public real: number;
    public imaginary: number;

    constructor(real: number, imaginary: number) {
        this.real = real;
        this.imaginary = imaginary;
    }

    public add(other: ComplexNumber): ComplexNumber {
        return new ComplexNumber(this.real + other.real, this.imaginary + other.imaginary);
    }

    public subtract(other: ComplexNumber): ComplexNumber {
        return new ComplexNumber(this.real - other.real, this.imaginary - other.imaginary);
    }

    public multiply(other: ComplexNumber): ComplexNumber {
        return new ComplexNumber(
            this.real * other.real - this.imaginary * other.imaginary,
            this.real * other.imaginary + this.imaginary * other.real
        );
    }

    public static exp(theta: number): ComplexNumber {
        return new ComplexNumber(Math.cos(theta), Math.sin(theta));
    }
}

// A function to create a random array of numbers, just for fun
function createRandomArray(size: number): number[] {
    return Array.from({ length: size }, () => Math.random() * 100);
}