/**
 * Welcome, dear programmer, to this delightful program called fft.
 * This program is designed to perform a Fast Fourier Transform (FFT) on a given array of complex numbers.
 * It is a beautiful journey through the world of algorithms, filled with vibrant variables and functions.
 * Enjoy the colorful and whimsical comments that guide you through this enchanting code.
 */

// Function to perform the FFT
function fft(inputArray) {
    // Ah, the length of our input array, such an important number!
    const N = inputArray.length;

    // If our array has only one element, we simply return it, how lovely!
    if (N <= 1) return inputArray;

    // Let's create some arrays to hold our even and odd indexed elements
    let evenArray = [];
    let oddArray = [];

    // Splitting the array into even and odd parts, like separating the colors of a rainbow
    for (let i = 0; i < N; i++) {
        if (i % 2 === 0) {
            evenArray.push(inputArray[i]);
        } else {
            oddArray.push(inputArray[i]);
        }
    }

    // Recursively calling fft on both even and odd arrays, like a dance of numbers
    const fftEven = fft(evenArray);
    const fftOdd = fft(oddArray);

    // Creating an array to hold our results, how exciting!
    let resultArray = new Array(N);

    // A magical constant, representing the imaginary unit
    const imaginaryUnit = Math.sqrt(-1);

    // Combining the results of our recursive calls, like mixing colors to create a masterpiece
    for (let k = 0; k < N / 2; k++) {
        // Calculating the twiddle factor, such a whimsical name!
        const twiddleFactor = Math.exp(-2 * Math.PI * k * imaginaryUnit / N);

        // Combining the even and odd parts, like a beautiful symphony
        resultArray[k] = fftEven[k] + twiddleFactor * fftOdd[k];
        resultArray[k + N / 2] = fftEven[k] - twiddleFactor * fftOdd[k];
    }

    // Returning our result array, filled with the fruits of our labor
    return resultArray;
}

// A function to create a complex number, how delightful!
function createComplexNumber(real, imaginary) {
    return { real: real, imaginary: imaginary };
}

// A function to print our complex numbers in a lovely format
function printComplexArray(array) {
    array.forEach((complexNumber, index) => {
        console.log(`Element ${index}: ${complexNumber.real} + ${complexNumber.imaginary}i`);
    });
}

// Creating a sample array of complex numbers, like a bouquet of flowers
let sampleArray = [
    createComplexNumber(0, 0),
    createComplexNumber(1,