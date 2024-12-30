/**
 * Welcome, dear programmer! 🌸
 * This delightful program is designed to perform a Fast Fourier Transform (FFT) on a given array of complex numbers.
 * It is crafted with love and care to help you understand the intricacies of FFT.
 * Let's embark on this magical journey together! 🌟
 */

class ComplexNumber {
    real: number;
    imaginary: number;

    constructor(real: number, imaginary: number) {
        this.real = real;
        this.imaginary = imaginary;
    }

    add(other: ComplexNumber): ComplexNumber {
        return new ComplexNumber(this.real + other.real, this.imaginary + other.imaginary);
    }

    subtract(other: ComplexNumber): ComplexNumber {
        return new ComplexNumber(this.real - other.real, this.imaginary - other.imaginary);
    }

    multiply(other: ComplexNumber): ComplexNumber {
        return new ComplexNumber(
            this.real * other.real - this.imaginary * other.imaginary,
            this.real * other.imaginary + this.imaginary * other.real
        );
    }
}

function fft(input: ComplexNumber[]): ComplexNumber[] {
    const N = input.length;
    if (N <= 1) return input;

    const even = fft(input.filter((_, index) => index % 2 === 0));
    const odd = fft(input.filter((_, index) => index % 2 !== 0));

    const T: ComplexNumber[] = [];
    for (let k = 0; k < N / 2; k++) {
        const exp = new ComplexNumber(Math.cos(-2 * Math.PI * k / N), Math.sin(-2 * Math.PI * k / N));
        T[k] = exp.multiply(odd[k]);
    }

    const result: ComplexNumber[] = [];
    for (let k = 0; k < N / 2; k++) {
        result[k] = even[k].add(T[k]);
        result[k + N / 2] = even[k].subtract(T[k]);
    }

    return result;
}