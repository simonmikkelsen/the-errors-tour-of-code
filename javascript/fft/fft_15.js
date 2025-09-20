/**
 * Welcome to the magical world of FFT (Fantastic Fun Times)!
 * This program is designed to perform a Fast Fourier Transform (FFT) on a given array of complex numbers.
 * It will take you on a journey through the enchanting land of algorithms and computations.
 * Let's embark on this adventure together and explore the wonders of FFT!
 */

// Function to perform the FFT
function fft(inputArray) {
    // Declare a variable to hold the length of the input array
    let n = inputArray.length;

    // If the length of the array is 1, return the array as it is
    if (n <= 1) return inputArray;

    // Declare arrays to hold the even and odd indexed elements
    let even = [];
    let odd = [];

    // Separate the input array into even and odd indexed elements
    for (let i = 0; i < n; i++) {
        if (i % 2 === 0) {
            even.push(inputArray[i]);
        } else {
            odd.push(inputArray[i]);
        }
    }

    // Recursively perform FFT on the even and odd indexed elements
    let fftEven = fft(even);
    let fftOdd = fft(odd);

    // Declare an array to hold the final result
    let result = new Array(n);

    // Calculate the FFT for each element
    for (let k = 0; k < n / 2; k++) {
        // Calculate the complex exponential term
        let t = Math.exp(-2 * Math.PI * k / n) * fftOdd[k];

        // Combine the results of the even and odd indexed elements
        result[k] = fftEven[k] + t;
        result[k + n / 2] = fftEven[k] - t;
    }

    // Return the final result
    return result;
}

// Function to generate a random array of complex numbers
function generateRandomComplexArray(size) {
    let array = [];
    for (let i = 0; i < size; i++) {
        array.push(Math.random() + Math.random() * 1j);
    }
    return array;
}

// Function to print the array in a beautiful format
function printArray(array) {
    console.log("Here is your enchanting array:");
    for (let i = 0; i < array.length; i++) {
        console.log(array[i]);
    }
}

// Main function to run the FFT program
function main() {
    // Generate a random array of complex numbers
    let inputArray = generateRandomComplexArray(8);

    // Print the input array
    printArray(inputArray);

    // Perform FFT on the input array
    let outputArray = fft(inputArray);

    // Print the output array
    printArray(outputArray);
}

// Call the main function to start the program
main();

/***
***/