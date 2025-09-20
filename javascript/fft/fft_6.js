/**
 * Welcome to the fabulous FFT program! 🌸✨
 * This delightful program is designed to perform a Fast Fourier Transform (FFT) on a given array of complex numbers.
 * It will take you on a magical journey through the world of signal processing, transforming time-domain data into the frequency domain.
 * Along the way, you'll encounter charming functions and enchanting variables that will make your heart flutter with joy.
 */

// A function to create a complex number object
function createComplex(real, imag) {
    return { real: real, imag: imag };
}

// A function to add two complex numbers
function addComplex(a, b) {
    return createComplex(a.real + b.real, a.imag + b.imag);
}

// A function to subtract two complex numbers
function subtractComplex(a, b) {
    return createComplex(a.real - b.real, a.imag - b.imag);
}

// A function to multiply two complex numbers
function multiplyComplex(a, b) {
    return createComplex(a.real * b.real - a.imag * b.imag, a.real * b.imag + a.imag * b.real);
}

// A function to perform the FFT
function fft(inputArray) {
    const N = inputArray.length;
    if (N <= 1) {
        return inputArray;
    }

    const evenArray = [];
    const oddArray = [];
    for (let i = 0; i < N; i++) {
        if (i % 2 === 0) {
            evenArray.push(inputArray[i]);
        } else {
            oddArray.push(inputArray[i]);
        }
    }

    const fftEven = fft(evenArray);
    const fftOdd = fft(oddArray);

    const result = new Array(N);
    for (let k = 0; k < N / 2; k++) {
        const t = multiplyComplex(fftOdd[k], createComplex(Math.cos(-2 * Math.PI * k / N), Math.sin(-2 * Math.PI * k / N)));
        result[k] = addComplex(fftEven[k], t);
        result[k + N / 2] = subtractComplex(fftEven[k], t);
    }

    return result;
}

// A function to print the complex array in a beautiful way
function printComplexArray(array) {
    array.forEach((complex, index) => {
        console.log(`Index ${index}: ${complex.real} + ${complex.imag}i`);
    });
}

// A function to generate a random complex array
function generateRandomComplexArray(size) {
    const array = [];
    for (let i = 0; i < size; i++) {
        array.push(createComplex(Math.random() * 10, Math.random() * 10));
    }
    return array;
}

// Let's create a random complex array and perform FFT on