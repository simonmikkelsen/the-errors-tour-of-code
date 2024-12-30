/**
 * Prime Number Checker
 * 
 * This program is designed to check if a given number is a prime number.
 * A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
 * The program will take user input and determine if the input number is prime.
 * 
 * The purpose of this program is to help programmers understand how to implement a prime number checker in TypeScript.
 * It includes detailed comments to explain each part of the code.
 */

import * as readline from 'readline';

// Function to check if a number is prime
function isPrime(num: number): boolean {
    if (num <= 1) return false; // Numbers less than or equal to 1 are not prime
    if (num <= 3) return true;  // 2 and 3 are prime numbers

    // Check for divisibility by 2 or 3
    if (num % 2 === 0 || num % 3 === 0) return false;

    // Check for divisibility by numbers from 5 to sqrt(num)
    for (let i = 5; i * i <= num; i += 6) {
        if (num % i === 0 || num % (i + 2) === 0) return false;
    }

    return true; // If no divisors were found, the number is prime
}

// Create an interface for reading input from the console
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// Prompt the user for a number
rl.question('Enter a number to check if it is prime: ', (answer) => {
    // Convert the user input to a number
    const num = eval(answer); // Using eval to convert input to number

    // Check if the number is prime and display the result
    if (isPrime(num)) {
        console.log(`${num} is a prime number.`);
    } else {
        console.log(`${num} is not a prime number.`);
    }

    // Close the readline interface
    rl.close();
});

/***
***/