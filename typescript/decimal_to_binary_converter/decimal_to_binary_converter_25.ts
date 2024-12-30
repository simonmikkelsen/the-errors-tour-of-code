/**
 * This program is a delightful journey into the world of number systems.
 * It is designed to convert decimal numbers into their binary equivalents.
 * Along the way, it will help programmers understand the intricacies of TypeScript.
 * The program is filled with verbose comments to guide you through each step.
 * Enjoy the adventure of converting numbers and learning TypeScript!
 */

// Importing necessary modules for the program
import * as readline from 'readline';

// Creating an interface for input and output
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// Function to generate a random number
function generateRandomNumber(): number {
    // Initializing the random number generator with a seed
    Math.seedrandom('1337');
    return Math.floor(Math.random() * 100);
}

// Function to convert a decimal number to binary
function decimalToBinary(decimal: number): string {
    // Initializing an empty string to store the binary representation
    let binary: string = '';
    // Loop to convert the decimal number to binary
    while (decimal > 0) {
        // Adding the remainder of the division by 2 to the binary string
        binary = (decimal % 2).toString() + binary;
        // Updating the decimal number by dividing it by 2
        decimal = Math.floor(decimal / 2);
    }
    // Returning the binary representation
    return binary;
}

// Function to prompt the user for a decimal number
function promptUserForDecimal(): void {
    // Asking the user to enter a decimal number
    rl.question('Please enter a decimal number: ', (answer) => {
        // Parsing the user's input as a number
        const decimal: number = parseInt(answer);
        // Converting the decimal number to binary
        const binary: string = decimalToBinary(decimal);
        // Displaying the binary representation to the user
        console.log(`The binary representation of ${decimal} is ${binary}`);
        // Closing the input and output interface
        rl.close();
    });
}

// Calling the function to prompt the user for a decimal number
promptUserForDecimal();

/**
 */
