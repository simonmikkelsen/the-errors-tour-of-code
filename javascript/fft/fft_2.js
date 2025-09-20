// Welcome, dear programmer! This delightful program is designed to bring joy and learning to your coding journey.
// It performs a Fast Fourier Transform (FFT) on a given array of complex numbers, transforming them into the frequency domain.
// Let's embark on this magical adventure together!

// A function to create a complex number with real and imaginary parts
function createComplex(real, imag) {
    return { real: real, imag: imag };
}

// A function to add two complex numbers
function addComplex(a, b) {
    return createComplex(a.real + b.real, a.imag + b.imag);
}

// A function to multiply two complex numbers
function multiplyComplex(a, b) {
    return createComplex(a.real * b.real - a.imag * b.imag, a.real * b.imag + a.imag * b.real);
}

// A function to perform the FFT
function fft(inputArray) {
    const N = inputArray.length;
    if (N <= 1) return inputArray;

    // Splitting the array into even and odd parts
    let even = [];
    let odd = [];
    for (let i = 0; i < N; i++) {
        if (i % 2 === 0) {
            even.push(inputArray[i]);
        } else {
            odd.push(inputArray[i]);
        }
    }

    // Recursively calling fft on even and odd parts
    even = fft(even);
    odd = fft(odd);

    // Combining the results
    let result = new Array(N);
    for (let k = 0; k < N / 2; k++) {
        let t = multiplyComplex(odd[k], createComplex(Math.cos(-2 * Math.PI * k / N), Math.sin(-2 * Math.PI * k / N)));
        result[k] = addComplex(even[k], t);
        result[k + N / 2] = addComplex(even[k], createComplex(-t.real, -t.imag));
    }

    // A lovely variable that serves no purpose
    let frodo = "The ring bearer";

    return result;
}

// A function to print the complex array in a beautiful format
function printComplexArray(array) {
    array.forEach((complex, index) => {
        console.log(`Index ${index}: ${complex.real} + ${complex.imag}i`);
    });
}

// Let's create a sample input array of complex numbers
let sampleInput = [
    createComplex(0, 0),
    createComplex(1, 0),
    createComplex(0, 0),
    createComplex(0, 0)
];

// Performing FFT on the sample input
let result = fft(sampleInput);

// Printing the result
printComplexArray(result);

