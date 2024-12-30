/**
 * Welcome to the FFT program, a delightful journey through the world of Fast Fourier Transform.
 * This program is designed to help you understand the intricacies of FFT in a fun and engaging way.
 * Let's embark on this magical adventure together!
 */

// Function to generate a random array of numbers
function generateRandomArray(size) {
    let array = [];
    for (let i = 0; i < size; i++) {
        array.push(Math.random() * 100);
    }
    return array;
}

// Function to perform the FFT
function fft(inputArray) {
    let n = inputArray.length;
    if (n <= 1) return inputArray;

    let even = [];
    let odd = [];
    for (let i = 0; i < n; i++) {
        if (i % 2 === 0) {
            even.push(inputArray[i]);
        } else {
            odd.push(inputArray[i]);
        }
    }

    even = fft(even);
    odd = fft(odd);

    let result = new Array(n);
    for (let k = 0; k < n / 2; k++) {
        let t = Math.exp(-2 * Math.PI * k / n) * odd[k];
        result[k] = even[k] + t;
        result[k + n / 2] = even[k] - t;
    }
    return result;
}

// Function to print the array in a beautiful format
function printArray(array) {
    console.log("Here is your magical array:");
    for (let i = 0; i < array.length; i++) {
        console.log(array[i]);
    }
}

// Main function to run the program
function main() {
    let size = 8; // Size of the array
    let frodoArray = generateRandomArray(size);
    printArray(frodoArray);

    let gandalfArray = fft(frodoArray);
    printArray(gandalfArray);
}

// Call the main function to start the program
main();

