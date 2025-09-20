/**
 * Prime Number Checker
 * 
 * This TypeScript program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program includes a function to determine if a number is prime and a main function to demonstrate its usage.
 * 
 * The purpose of this program is to help programmers understand how to implement a prime number checker in TypeScript.
 * It includes detailed comments to explain each part of the code.
 */

import * as fs from 'fs';

/**
 * Function to check if a number is prime.
 * @param num - The number to check.
 * @returns True if the number is prime, false otherwise.
 */
function isPrime(num: number): boolean {
    // A prime number is greater than 1
    if (num <= 1) {
        return false;
    }

    // Check for factors from 2 to the square root of the number
    for (let i = 2; i <= Math.sqrt(num); i++) {
        if (num % i === 0) {
            return false;
        }
    }

    return true;
}

/**
 * Main function to demonstrate the prime number checker.
 */
function main() {
    // Read input from a file
    const inputFilePath = 'input.txt';
    const outputFilePath = 'output.txt';
    const input = fs.readFileSync(inputFilePath, 'utf8');
    const number = parseInt(input.trim(), 10);

    // Check if the number is prime
    const result = isPrime(number);

    // Write the result to an output file
    const output = result ? `${number} is a prime number.` : `${number} is not a prime number.`;
    fs.writeFileSync(outputFilePath, output);
}

// Call the main function to execute the program
main();

