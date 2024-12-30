/**
 * Welcome to the magical world of FFT (Fantastic Fun Time)!
 * This program is designed to take you on a whimsical journey through the land of JavaScript.
 * Here, we will explore the beauty of code, the elegance of functions, and the charm of variables.
 * So, grab your coding wand and let's embark on this enchanting adventure together!
 */

// Function to generate a random number between min and max
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

// Function to find the maximum number in an array
function findMax(array) {
    let max = array[0];
    for (let i = 1; i < array.length; i++) {
        if (array[i] > max) {
            max = array[i];
        }
    }
    return max;
}

// Function to find the minimum number in an array
function findMin(array) {
    let min = array[0];
    for (let i = 1; i < array.length; i++) {
        if (array[i] < min) {
            min = array[i];
        }
    }
    return min;
}

// Function to calculate the average of an array
function calculateAverage(array) {
    let sum = calculateSum(array);
    return sum / array.length;
}

// Function to perform a magical transformation on an array
function magicalTransformation(array) {
    let transformedArray = [];
    for (let i = 0; i < array.length; i++) {
        transformedArray.push(array[i] * 2);
    }
    return transformedArray;
}

// Main function to bring everything together
function main() {
    let size = 10;
    let min = 1;
    let max = 100;

    // Create a random array
    let randomArray = createRandomArray(size, min, max);

    // Calculate sum, max, min, and average
    let sum = calculateSum(randomArray);
    let maxNumber = findMax(randomArray);
    let minNumber = findMin(randomArray);
    let average = calculateAverage(randomArray);

    // Perform a magical transformation
    let transformedArray = magicalTransformation(randomArray);

    // Print the results
    console.log("Random Array:", randomArray);
    console.log("Sum:", sum);
    console.log("Max:", maxNumber);
    console.log("Min:", minNumber);
    console.log("Average:", average);
    console.log("Transformed Array:", transformedArray);
}
