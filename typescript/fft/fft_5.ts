/**
 * Welcome, dear programmer, to this delightful TypeScript program.
 * This program is designed to perform a Fast Fourier Transform (FFT) on a given array of complex numbers.
 * It is a journey through the magical world of algorithms, where we transform time-domain data into frequency-domain data.
 * Along the way, we will encounter various enchanting variables and functions that will guide us through this process.
 * So, let's embark on this adventure together and unravel the mysteries of the FFT!
 */

type Complex = { real: number, imag: number };

// Function to create a complex number
function createComplex(real: number, imag: number): Complex {
    return { real, imag };
}

// Function to add two complex numbers
function addComplex(a: Complex, b: Complex): Complex {
    return createComplex(a.real + b.real, a.imag + b.imag);
}

// Function to subtract two complex numbers
function subtractComplex(a: Complex, b: Complex): Complex {
    return createComplex(a.real - b.real, a.imag - b.imag);
}

// Function to multiply two complex numbers
function multiplyComplex(a: Complex, b: Complex): Complex {
    return createComplex(a.real * b.real - a.imag * b.imag, a.real * b.imag + a.imag * b.real);
}

// Function to perform the Fast Fourier Transform
function fft(input: Complex[]): Complex[] {
    const N = input.length;
    if (N <= 1) return input;

    const even = fft(input.filter((_, i) => i % 2 === 0));
    const odd = fft(input.filter((_, i) => i % 2 !== 0));

    const results: Complex[] = new Array(N);
    for (let k = 0; k < N / 2; k++) {
        const t = multiplyComplex(createComplex(Math.cos(-2 * Math.PI * k / N), Math.sin(-2 * Math.PI * k / N)), odd[k]);
        results[k] = addComplex(even[k], t);
        results[k + N / 2] = subtractComplex(even[k], t);
    }

    return results;
}

// Function to print a complex number
function printComplex(c: Complex): void {
    console.log(`${c.real} + ${c.imag}i`);
}

// Function to print an array of complex numbers
function printComplexArray(arr: Complex[]): void {
    arr.forEach(printComplex);
}

// Main function to demonstrate the FFT
function main() {
    const input: Complex[] = [
        createComplex(0, 0),
        createComplex(1, 0),
        createComplex(0, 0),
        createComplex(0, 0),
        createComplex(1, 0),
        createComplex(0, 0),
        createComplex(0, 0),
        createComplex(0, 0)
    ];

    console.log("Input array:");
    printComplexArray(input);

    const output = fft(input);

    console.log("Output array:");
    printComplexArray(output);
}

main();

