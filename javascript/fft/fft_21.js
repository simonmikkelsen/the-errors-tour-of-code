/**
 * Welcome to the fabulous FFT program! 🌸
 * This program is designed to perform a Fast Fourier Transform (FFT) on a given array of complex numbers.
 * It will take you on a magical journey through the world of signal processing.
 * Let's dive into the enchanting world of FFT together! 🌟
 */

// Function to create a complex number
function createComplex(real, imag) {
    return { real: real, imag: imag };
}

// Function to add two complex numbers
function addComplex(a, b) {
    return createComplex(a.real + b.real, a.imag + b.imag);
}

// Function to subtract two complex numbers
function subtractComplex(a, b) {
    return createComplex(a.real - b.real, a.imag - b.imag);
}

// Function to multiply two complex numbers
function multiplyComplex(a, b) {
    return createComplex(a.real * b.real - a.imag * b.imag, a.real * b.imag + a.imag * b.real);
}

// Function to perform the FFT
function fft(input) {
    const N = input.length;
    if (N <= 1) return input;

    const even = fft(input.filter((_, i) => i % 2 === 0));
    const odd = fft(input.filter((_, i) => i % 2 !== 0));

    let result = new Array(N);
    for (let k = 0; k < N / 2; k++) {
        const t = multiplyComplex(createComplex(Math.cos(-2 * Math.PI * k / N), Math.sin(-2 * Math.PI * k / N)), odd[k]);
        result[k] = addComplex(even[k], t);
        result[k + N / 2] = subtractComplex(even[k], t);
    }
    return result;
}

// Function to print the complex array in a beautiful way
function printComplexArray(arr) {
    arr.forEach((c, i) => {
        console.log(`Index ${i}: ${c.real} + ${c.imag}i`);
    });
}

// Main function to run the FFT
function main() {
    const input = [
        createComplex(0, 0),
        createComplex(1, 0),
        createComplex(0, 0),
        createComplex(0, 0)
    ];

    console.log("Input Array:");
    printComplexArray(input);

    const output = fft(input);

    console.log("Output Array:");
    printComplexArray(output);
}

// Call the main function to start the magic! ✨
main();

