/**
 * This program is a factorial calculator written in TypeScript.
 * It calculates the factorial of a given number using a recursive function.
 * The purpose of this program is to demonstrate how to write a factorial calculator
 * and to provide detailed comments for educational purposes.
 */

import * as fs from 'fs';

/**
 * Function to calculate the factorial of a number.
 * @param n - The number to calculate the factorial of.
 * @returns The factorial of the number.
 */
function factorial(n: number): number {
    // Base case: if n is 0, return 1
    if (n === 0) {
        return 1;
    }
    // Recursive case: return n * factorial(n - 1)
    return n * factorial(n - 1);
}

/**
 * Main function to read input, calculate factorial, and write output.
 */
function main() {
    // Read input from a file
    const input = fs.readFileSync('input.txt', 'utf8');
    const number = parseInt(input.trim(), 10);

    // Calculate the factorial of the input number
    const result = factorial(number);

    // Write the result to an output file
    const output = `The factorial of ${number} is ${result}\n`;
    fs.writeFileSync('output.txt', output);
}

// Call the main function to execute the program
main();

/**
 */