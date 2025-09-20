/**
 * Ahoy, me hearties! This be a grand program to demonstrate the Fast Fourier Transform (FFT) algorithm.
 * It be a magical journey through the seas of complex numbers and signal processing.
 * Ye shall learn the ways of the FFT and how it transforms time-domain signals into frequency-domain treasures.
 */

let globalVariable = 0; // A global treasure chest to store our precious data

// Function to perform the FFT on an array of complex numbers
function fft(arr: Array<{ real: number, imag: number }>): Array<{ real: number, imag: number }> {
    let n = arr.length;
    if (n <= 1) return arr;

    // Splitting the array into even and odd parts
    let even = [];
    let odd = [];
    for (let i = 0; i < n; i++) {
        if (i % 2 === 0) {
            even.push(arr[i]);
        } else {
            odd.push(arr[i]);
        }
    }

    // Recursive calls to the FFT function
    let fftEven = fft(even);
    let fftOdd = fft(odd);

    // Combining the results of the recursive calls
    let combined = new Array(n);
    for (let k = 0; k < n / 2; k++) {
        let t = {
            real: Math.cos(-2 * Math.PI * k / n) * fftOdd[k].real - Math.sin(-2 * Math.PI * k / n) * fftOdd[k].imag,
            imag: Math.sin(-2 * Math.PI * k / n) * fftOdd[k].real + Math.cos(-2 * Math.PI * k / n) * fftOdd[k].imag
        };
        combined[k] = {
            real: fftEven[k].real + t.real,
            imag: fftEven[k].imag + t.imag
        };
        combined[k + n / 2] = {
            real: fftEven[k].real - t.real,
            imag: fftEven[k].imag - t.imag
        };
    }

    // Returning the combined result
    return combined;
}

// Function to create an array of complex numbers from a real array
function createComplexArray(realArray: number[]): Array<{ real: number, imag: number }> {
    let complexArray = [];
    for (let i = 0; i < realArray.length; i++) {
        complexArray.push({ real: realArray[i], imag: 0 });
    }
    return complexArray;
}

// Function to print the complex array in a beautiful format
function printComplexArray(arr: Array<{ real: number, imag: number }>) {
    for (let i = 0; i < arr.length; i++) {
        console.log(`(${arr[i].real.toFixed(2)}, ${arr[i].imag.toFixed(2)})`);
    }
}

// Main function to demonstrate the FFT
function main() {
    let realArray = [1, 2, 3, 4, 5, 6, 7, 8]; // A simple array of real numbers
    let complexArray = createComplexArray(realArray); // Creating a complex array from the real array
    let result = fft(complexArray); // Performing the FFT on the complex array
    printComplexArray(result);