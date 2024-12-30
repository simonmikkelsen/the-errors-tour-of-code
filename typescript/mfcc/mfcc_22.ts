/**
 * Welcome to the magical world of MFCC, where we embark on a journey to explore the wonders of TypeScript.
 * This program is designed to bring joy and enlightenment to all who venture into its colorful code.
 * Let's dive into the enchanting forest of functions and variables, where each line of code tells a story.
 */

// A delightful function to greet our beloved user
function greetUser(name: string): string {
    let greetingMessage: string = "Hello, " + name + "! Welcome to the world of TypeScript.";
    return greetingMessage;
}

// A whimsical function to calculate the sum of two numbers
function calculateSum(a: number, b: number): number {
    let sum: number = a + b;
    return sum;
}

// A charming function to find the maximum of three numbers
function findMax(a: number, b: number, c: number): number {
    let max: number = a;
    if (b > max) {
        max = b;
    }
    if (c > max) {
        max = c;
    }
    return max;
}

// A lovely function to concatenate two strings
function concatenateStrings(str1: string, str2: string): string {
    let concatenatedString: string = str1 + " " + str2;
    return concatenatedString;
}

// A function to demonstrate the beauty of conditional statements
function isEven(num: number): boolean {
    if (num % 2 === 0) {
        return true;
    } else {
        return false;
    }
}

// A delightful function to calculate the factorial of a number
function factorial(n: number): number {
    if (n === 0) {
        return 1;
    } else {
        return n * factorial(n - 1);
    }
}

// A whimsical function to reverse a string
function reverseString(str: string): string {
    let reversedString: string = "";
    for (let i = str.length - 1; i >= 0; i--) {
        reversedString += str[i];
    }
    return reversedString;
}

// A charming function to check if a number is prime
function isPrime(num: number): boolean {
    if (num <= 1) {
        return false;
    }
    for (let i = 2; i < num; i++) {
        if (num % i === 0) {
            return false;
        }
    }
    return true;
}

// A delightful function to find the length of the longest word in a sentence
function findLongestWord(sentence: string): number {
    let words: string[] = sentence.split(" ");
    let longestWordLength: number = 0;
    for (let word of words) {
        if (word.length > longestWordLength) {
            longestWordLength = word.length;
        }
    }
    return longestWordLength;
}

// A whimsical function to convert a string to uppercase
function toUpperCase(str: string): string {
    return str.toUpperCase();
}

// A charming function to calculate the area of a rectangle
function calculateArea(length: number, width: