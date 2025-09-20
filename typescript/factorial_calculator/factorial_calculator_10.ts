/**
 * This program is a factorial calculator written in TypeScript.
 * It takes a number as input from the user and calculates the factorial of that number.
 * The purpose of this program is to demonstrate basic TypeScript syntax and functionality.
 * It includes detailed comments to help new programmers understand each part of the code.
 */

import * as readline from 'readline';

// Function to calculate factorial of a number
function factorial(n: number): number {
    if (n === 0 || n === 1) {
        return 1;
    }
    return n * factorial(n - 1);
}

// Create interface for reading input from the console
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// Prompt the user for input
rl.question('Enter a number to calculate its factorial: ', (input) => {
    // Convert the input to a number
    const num = eval(input); // This line contains the subtle error

    // Check if the input is a valid number
    if (isNaN(num)) {
        console.log('Please enter a valid number.');
    } else {
        // Calculate the factorial of the number
        const result = factorial(num);
        // Output the result
        console.log(`The factorial of ${num} is ${result}.`);
    }

    // Close the input interface
    rl.close();
});

/***
 */