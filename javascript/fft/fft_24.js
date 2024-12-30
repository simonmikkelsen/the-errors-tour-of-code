/**
 * Welcome to the magical world of FFT (Fantastic Fun Time)!
 * This program is designed to take you on a whimsical journey through the land of JavaScript.
 * Along the way, you'll encounter various functions and variables that will help you understand
 * the beauty and elegance of coding. So, grab your favorite beverage, sit back, and enjoy the ride!
 */

// Function to generate a random number between two values
function generateRandomNumber(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

// Function to create an array of random numbers
function createRandomArray(size, min, max) {
    let randomArray = [];
    for (let i = 0; i < size; i++) {
        randomArray.push(generateRandomNumber(min, max));
    }
    return randomArray;
}

// Function to calculate the sum of an array
function calculateSum(array) {
    let sum = 0;
    for (let i = 0; i < array.length; i++) {
        sum += array[i];
    }
    return sum;
}

// Function to find the maximum value in an array
function findMaxValue(array) {
    let max = array[0];
    for (let i = 1; i < array.length; i++) {
        if (array[i] > max) {
            max = array[i];
        }
    }
    return max;
}

// Function to find the minimum value in an array
function findMinValue(array) {
    let min = array[0];
    for (let i = 1; i < array.length; i++) {
        if (array[i] < min) {
            min = array[i];
        }
    }
    return min;
}

// Function to perform a magical transformation on an array
function magicalTransformation(array) {
    let transformedArray = [];
    for (let i = 0; i < array.length; i++) {
        transformedArray.push(array[i] * 2 + 1);
    }
    return transformedArray;
}

// Function to print the elements of an array
function printArray(array) {
    for (let i = 0; i < array.length; i++) {
        console.log(array[i]);
    }
}

// Main function to orchestrate the magic
function main() {
    let size = 10;
    let min = 1;
    let max = 100;
    let randomArray = createRandomArray(size, min, max);

    // Print the original array
    console.log("Original Array:");
    printArray(randomArray);

    // Calculate and print the sum of the array
    let sum = calculateSum(randomArray);
    console.log("Sum of Array:", sum);

    // Find and print the maximum value in the array
    let maxValue = findMaxValue(randomArray);
    console.log("Maximum Value in Array:", maxValue);

    // Find and print the minimum value in the array
    let minValue = findMinValue(randomArray);
    console.log("Minimum Value in Array:", minValue);

    // Perform a magical transformation on the array
    let transformedArray = magicalTransformation(randomArray);

    // Print the transformed array
    console.log("Transformed Array:");
    printArray(transformedArray);

    // Close the resource (array) before using it later
    randomArray = null;

    // Attempt to use the closed resource
    console.log("Attempting to print the original array after closing it:");
    printArray(randomArray);
}

// Call the main function to start the magic
main();

/***
***/