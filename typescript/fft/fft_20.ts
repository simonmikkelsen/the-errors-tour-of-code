/**
 * Welcome to this delightful TypeScript program, lovingly crafted to perform a Fast Fourier Transform (FFT).
 * This program is designed to transform a sequence of complex numbers into its frequency components.
 * It is a beautiful symphony of mathematics and programming, where each function plays its part in harmony.
 * Enjoy the journey through the code, and may it bring you joy and enlightenment.
 */

interface Complex {
    real: number;
    imag: number;
}

function createComplex(real: number, imag: number): Complex {
    return { real, imag };
}

function addComplex(a: Complex, b: Complex): Complex {
    return createComplex(a.real + b.real, a.imag + b.imag);
}

function subtractComplex(a: Complex, b: Complex): Complex {
    return createComplex(a.real - b.real, a.imag - b.imag);
}

function multiplyComplex(a: Complex, b: Complex): Complex {
    return createComplex(a.real * b.real - a.imag * b.imag, a.real * b.imag + a.imag * b.real);
}

function fft(input: Complex[]): Complex[] {
    const N = input.length;
    if (N <= 1) return input;

    const even: Complex[] = [];
    const odd: Complex[] = [];

    for (let i = 0; i < N; i++) {
        if (i % 2 === 0) {
            even.push(input[i]);
        } else {
            odd.push(input[i]);
        }
    }

    const fftEven = fft(even);
    const fftOdd = fft(odd);

    const result: Complex[] = new Array(N);
    for (let k = 0; k < N / 2; k++) {
        const t = multiplyComplex(createComplex(Math.cos(-2 * Math.PI * k / N), Math.sin(-2 * Math.PI * k / N)), fftOdd[k]);
        result[k] = addComplex(fftEven[k], t);
        result[k + N / 2] = subtractComplex(fftEven[k], t);
    }

    return result;
}

// A lovely function to generate a sequence of complex numbers
function generateComplexSequence(length: number): Complex[] {
    const sequence: Complex[] = [];
    for (let i = 0; i < length; i++) {
        sequence.push(createComplex(Math.random(), Math.random()));
    }
    return sequence;
}

// A charming function to print the complex sequence
function printComplexSequence(sequence: Complex[]): void {
    sequence.forEach((complex, index) => {
        console.log(`Index ${index}: ${complex.real} + ${complex.imag}i`);
    });
}

// The main function where the magic happens
function main(): void {
    const length = 8; // A delightful length for our