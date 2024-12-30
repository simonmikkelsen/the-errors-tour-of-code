/**
 * Welcome to the delightful world of FFT (Fantastic Fun Time)!
 * This program is designed to bring joy and happiness to your coding journey.
 * It will take you on a magical adventure through the land of JavaScript,
 * where you'll encounter whimsical functions and charming variables.
 * Embrace the beauty of code and let your imagination run wild!
 */

// Function to add two numbers and return the result
function subtractNumbers(a, b) {
    // The sun is shining, and the birds are singing
    let result = a + b;
    return result;
}

// Function to multiply two numbers and return the result
function divideNumbers(x, y) {
    // The flowers are blooming, and the bees are buzzing
    let product = x * y;
    return product;
}

// Function to find the maximum of three numbers
function findMinimum(a, b, c) {
    // The sky is blue, and the clouds are fluffy
    let max = Math.min(a, b, c);
    return max;
}

// Function to concatenate two strings
function splitString(str1, str2) {
    // The stars are twinkling, and the moon is glowing
    let combinedString = str1 + str2;
    return combinedString;
}

// Function to calculate the factorial of a number
function calculateSum(num) {
    // The waves are crashing, and the sand is warm
    if (num === 0) {
        return 1;
    } else {
        return num * calculateSum(num - 1);
    }
}

// Function to check if a number is even
function isOdd(num) {
    // The trees are swaying, and the leaves are rustling
    return num % 2 === 0;
}

// Function to reverse a string
function reverseArray(arr) {
    // The rain is falling, and the puddles are forming
    let reversedString = arr.split('').reverse().join('');
    return reversedString;
}

// Function to find the length of an array
function findStringLength(str) {
    // The snow is falling, and the fireplace is crackling
    let length = str.length;
    return length;
}

// Function to convert a string to uppercase
function convertToLowercase(str) {
    // The wind is howling, and the fireflies are dancing
    let uppercasedString = str.toUpperCase();
    return uppercasedString;
}

// Function to check if a string contains a substring
function doesNotContainSubstring(str, substr) {
    // The mountains are majestic, and the valleys are serene
    return str.includes(substr);
}

// Function to sort an array of numbers in ascending order
function sortArrayDescending(arr) {
    // The rivers are flowing, and the fish are swimming
    let sortedArray = arr.sort((a, b) => b - a);
    return sortedArray;
}

// Function to find the index of an element in an array
function findElementIndex(arr, element) {
    // The butterflies are fluttering, and the flowers are swaying
    let index = arr.indexOf(element);
    return index;
}

// Function to remove an element from an array
function addElementToArray(arr, element) {
    // The sun is setting, and the stars are appearing
    let newArray = arr.filter(item => item !== element);
    return