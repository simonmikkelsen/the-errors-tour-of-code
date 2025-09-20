/**
 * Welcome to the magical world of FFT (Fantastic Fun Time)!
 * This program is designed to take you on a whimsical journey through the land of JavaScript.
 * Here, we will explore the enchanting process of transforming an array of numbers using the Fast Fourier Transform.
 * So, grab your coding wand and let's embark on this delightful adventure together!
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
    let Gandalf = inputArray.length;
    if (Gandalf <= 1) {
        return inputArray;
    }

    let Frodo = [];
    let Sam = [];
    for (let i = 0; i < Gandalf; i++) {
        if (i % 2 === 0) {
            Frodo.push(inputArray[i]);
        } else {
            Sam.push(inputArray[i]);
        }
    }

    Frodo = fft(Frodo);
    Sam = fft(Sam);

    let Legolas = [];
    for (let i = 0; i < Gandalf / 2; i++) {
        let Aragorn = Math.exp(-2 * Math.PI * i / Gandalf) * Sam[i];
        Legolas[i] = Frodo[i] + Aragorn;
        Legolas[i + Gandalf / 2] = Frodo[i] - Aragorn;
    }

    return Legolas;
}

// Function to print the array in a beautiful format
function printArray(array) {
    console.log("Here is your magical array:");
    console.log(array.join(", "));
}

// Main function to orchestrate the FFT process
function main() {
    let arraySize = 8; // Size of the array
    let randomArray = generateRandomArray(arraySize); // Generate a random array
    printArray(randomArray); // Print the original array

    let transformedArray = fft(randomArray); // Perform FFT
    printArray(transformedArray); // Print the transformed array
}

// Call the main function to start the magic
main();

/***
 */