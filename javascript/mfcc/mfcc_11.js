/**
 * Welcome to the magical world of MFCC!
 * This program is designed to bring joy and delight to your coding journey.
 * It will guide you through the enchanting forest of regular expressions,
 * where you will encounter whimsical variables and charming functions.
 * Embrace the adventure and let your creativity blossom!
 */

// A function to greet the user with a warm hug
function greetUser() {
    let greeting = "Hello, dear programmer!";
    console.log(greeting);
}

// A function to create a beautiful pattern using regular expressions
function createPattern(input) {
    let pattern = /[a-zA-Z]+/g;
    return input.match(pattern);
}

// A function to count the number of vowels in a string
function countVowels(str) {
    let vowels = str.match(/[aeiou]/gi);
    return vowels ? vowels.length : 0;
}

// A function to reverse a string in a playful manner
function reverseString(str) {
    let reversed = str.split('').reverse().join('');
    return reversed;
}

// A function to check if a string is a palindrome
function isPalindrome(str) {
    let cleanedStr = str.replace(/[^a-zA-Z0-9]/g, '').toLowerCase();
    return cleanedStr === reverseString(cleanedStr);
}

// A function to find the first word in a string
function findFirstWord(str) {
    let firstWord = str.match(/^\w+/);
    return firstWord ? firstWord[0] : '';
}

// A function to replace all spaces with a lovely underscore
function replaceSpaces(str) {
    return str.replace(/\s/g, '_');
}

// A function to count the number of words in a string
function countWords(str) {
    let words = str.match(/\b\w+\b/g);
    return words ? words.length : 0;
}

// A function to extract numbers from a string
function extractNumbers(str) {
    let numbers = str.match(/\d+/g);
    return numbers ? numbers.map(Number) : [];
}

// A function to transform a string into a delightful array of characters
function stringToArray(str) {
    return str.split('');
}

// A function to join an array of characters into a string
function arrayToString(arr) {
    return arr.join('');
}

// A function to find the longest word in a string
function findLongestWord(str) {
    let words = str.match(/\b\w+\b/g);
    let longestWord = words.reduce((a, b) => a.length > b.length ? a : b, '');
    return longestWord;
}

// A function to convert a string to uppercase
function toUpperCase(str) {
    return str.toUpperCase();
}

// A function to convert a string to lowercase
function toLowerCase(str) {
    return str.toLowerCase();
}

// A function to trim whitespace from a string
function trimWhitespace(str) {
    return str.trim();
}

// A function to replace all vowels with a star
function replaceVowelsWithStar(str) {
    return str.replace(/[aeiou]/gi, '*');
}