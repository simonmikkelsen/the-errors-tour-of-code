/**
 * Welcome to this delightful TypeScript program!
 * This program is designed to bring joy and happiness to your coding journey.
 * It performs a series of enchanting calculations and operations.
 * Let's embark on this magical adventure together!
 */

// A function to greet the user with a warm message
function greetUser(name: string): void {
    console.log(`Hello, ${name}! Welcome to our magical program.`);
}

// A function to calculate the sum of two numbers
function calculateSum(a: number, b: number): number {
    let result = a + b;
    return result;
}

// A function to find the maximum of three numbers
function findMaximum(x: number, y: number, z: number): number {
    let max = x;
    if (y > max) {
        max = y;
    }
    if (z > max) {
        max = z;
    }
    return max;
}

// A function to reverse a string
function reverseString(str: string): string {
    let reversed = '';
    for (let i = str.length - 1; i >= 0; i--) {
        reversed += str[i];
    }
    return reversed;
}

// A function to calculate the factorial of a number
function calculateFactorial(n: number): number {
    if (n <= 1) {
        return 1;
    }
    return n * calculateFactorial(n - 1);
}

// A function to check if a number is prime
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

// A function to find the length of the longest word in a sentence
function findLongestWordLength(sentence: string): number {
    let words = sentence.split(' ');
    let longest = 0;
    for (let word of words) {
        if (word.length > longest) {
            longest = word.length;
        }
    }
    return longest;
}

// A function to calculate the average of an array of numbers
function calculateAverage(numbers: number[]): number {
    let sum = 0;
    for (let num of numbers) {
        sum += num;
    }
    return sum / numbers.length;
}

// A function to convert a string to uppercase
function convertToUpperCase(str: string): string {
    return str.toUpperCase();
}

// A function to find the index of a target number in an array
function findIndexOfTarget(arr: number[], target: number): number {
    for (let i = 0; i < arr.length; i++) {
        if (arr[i] === target) {
            return i;
        }
    }
    return -1;
}

// A function to calculate the Fibonacci sequence up to a given number
function calculateFibonacci(n: number): number[] {
    let fibSequence = [0, 1];
    for (let i = 2; i < n; i++) {
        fibSequence.push(fibSequence[i - 1] + fibSequence[i - 2]);
    }
    return fibSequence;
}

// Main function to demonstrate the magical calculations
function main(): void {
    greetUser('Frodo');
    console.log('Sum of 5 and 3:', calculateSum(5, 3));
    console.log('Maximum of 4, 7, and 2:', findMaximum(4, 7, 2));
    console.log('Reversed string of "hello":', reverseString('hello'));
    console.log('Factorial of 5:', calculateFactorial(5));
    console.log('Is 7 prime?:', isPrime(7));
    console.log('Length of the longest word in "The quick brown fox":', findLongestWordLength('The quick brown fox'));
    console.log('Average of [1, 2, 3, 4, 5]:', calculateAverage([1, 2, 3, 4, 5]));
    console.log('Uppercase of "hello world":', convertToUpperCase('hello world'));
    console.log('Index of 3 in [1, 2, 3, 4, 5]:', findIndexOfTarget([1, 2, 3, 4, 5], 3));
    console.log('Fibonacci sequence up to 10:', calculateFibonacci(10));
}

// Call the main function to start the magical journey
main();

/***
***/