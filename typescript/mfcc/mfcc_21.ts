/**
 * Welcome to the Magical Function Calculation Center (MFCC)!
 * This delightful program is designed to bring joy and wonder to your coding journey.
 * It will guide you through the enchanting world of TypeScript with a sprinkle of magic.
 * Let's embark on this whimsical adventure together!
 */

// A lovely function to add two numbers
function add(a: number, b: number): number {
    return a + b;
}

// A charming function to multiply two numbers
function multiply(a: number, b: number): number {
    return a * b;
}

// A delightful function to calculate the factorial of a number
function factorial(n: number): number {
    if (n <= 1) return 1;
    return n * factorial(n - 1);
}

// A whimsical function to find the maximum of three numbers
function findMax(a: number, b: number, c: number): number {
    return Math.max(a, b, c);
}

// A magical function to reverse a string
function reverseString(str: string): string {
    return str.split('').reverse().join('');
}

// A function to demonstrate the beauty of recursion
function fibonacci(n: number): number {
    if (n <= 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
}

// A function to calculate the sum of an array of numbers
function sumArray(arr: number[]): number {
    let sum = 0;
    for (let num of arr) {
        sum += num;
    }
    return sum;
}

// A function to find the average of an array of numbers
function averageArray(arr: number[]): number {
    let sum = sumArray(arr);
    return sum / arr.length;
}

// A function to demonstrate the power of closures
function createCounter() {
    let count = 0;
    return function() {
        count++;
        return count;
    };
}

// A function to demonstrate the elegance of higher-order functions
function mapArray(arr: number[], fn: (num: number) => number): number[] {
    let result: number[] = [];
    for (let num of arr) {
        result.push(fn(num));
    }
    return result;
}

// A function to demonstrate the beauty of nested functions
function nestedFunctions() {
    function innerFunction() {
        return "Inner Function";
    }
    return innerFunction();
}

// A function to demonstrate the charm of default parameters
function greet(name: string = "Stranger"): string {
    return `Hello, ${name}!`;
}

// A function to demonstrate the allure of destructuring
function getCoordinates() {
    return { x: 10, y: 20 };
}

let { x, y } = getCoordinates();
