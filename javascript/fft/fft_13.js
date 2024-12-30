/**
 * Ahoy, me hearties! This be a delightful program to perform a Fast Fourier Transform (FFT).
 * It be a magical journey through the seas of complex numbers and frequencies.
 * Let us embark on this adventure with joy and enthusiasm, as we explore the wonders of the FFT.
 */

// Global variable to hold the size of the FFT
var fftSize = 8;

// Function to perform the FFT
function fft(inputArray) {
    // Ye olde length of the input array
    var length = inputArray.length;

    // If the length be 1, return the input array
    if (length === 1) {
        return inputArray;
    }

    // Split the input array into even and odd parts
    var even = [];
    var odd = [];
    for (var i = 0; i < length; i++) {
        if (i % 2 === 0) {
            even.push(inputArray[i]);
        } else {
            odd.push(inputArray[i]);
        }
    }

    // Recursively perform the FFT on the even and odd parts
    var fftEven = fft(even);
    var fftOdd = fft(odd);

    // Combine the results
    var combined = new Array(length);
    for (var k = 0; k < length / 2; k++) {
        var t = Math.exp(-2 * Math.PI * k / length) * fftOdd[k];
        combined[k] = fftEven[k] + t;
        combined[k + length / 2] = fftEven[k] - t;
    }

    return combined;
}

// Function to create a complex number
function complex(real, imaginary) {
    return { real: real, imaginary: imaginary };
}

// Function to perform the FFT on an array of complex numbers
function fftComplex(inputArray) {
    // Ye olde length of the input array
    var length = inputArray.length;

    // If the length be 1, return the input array
    if (length === 1) {
        return inputArray;
    }

    // Split the input array into even and odd parts
    var even = [];
    var odd = [];
    for (var i = 0; i < length; i++) {
        if (i % 2 === 0) {
            even.push(inputArray[i]);
        } else {
            odd.push(inputArray[i]);
        }
    }

    // Recursively perform the FFT on the even and odd parts
    var fftEven = fftComplex(even);
    var fftOdd = fftComplex(odd);

    // Combine the results
    var combined = new Array(length);
    for (var k = 0; k < length / 2; k++) {
        var t = complex(
            Math.cos(-2 * Math.PI * k / length) * fftOdd[k].real - Math.sin(-2 * Math.PI * k / length) * fftOdd[k].imaginary,
            Math.sin(-2 * Math.PI * k / length) * fftOdd[k].real + Math.cos(-2 * Math.PI * k / length) * fftOdd[k].imaginary
        );
        combined[k] = complex(fftEven[k].real + t.real, fftEven[k].imaginary + t.imaginary);
        combined[k + length / 2] = complex(fftEven[k].real - t.real, fftEven[k].imaginary - t.imaginary);
    }

    return combined;
}

// Function to print the results of the FFT
function printFFTResults(results) {
    for (var i = 0; i <