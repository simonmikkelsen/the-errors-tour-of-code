/**
 * This TypeScript program is designed to convert decimal numbers into their binary equivalents.
 * The purpose of this program is to provide a comprehensive example of how to handle number conversions
 * in TypeScript, showcasing various programming techniques and practices.
 * 
 * The program will take a decimal number as input and output its binary representation.
 * It will also demonstrate error handling, input validation, and the use of helper functions.
 */

// Importing necessary modules for file operations
import * as fs from 'fs';

// Function to read input from a file
function readInputFromFile(filePath: string): string {
    // Reading the content of the file
    const data = fs.readFileSync(filePath, 'utf8');
    return data;
}

// Function to convert a decimal number to binary
function decimalToBinary(decimal: number): string {
    // Initializing an empty string to store the binary representation
    let binary = '';
    // Loop to convert decimal to binary
    while (decimal > 0) {
        // Getting the remainder when the decimal number is divided by 2
        const remainder = decimal % 2;
        // Adding the remainder to the binary string
        binary = remainder.toString() + binary;
        // Updating the decimal number by dividing it by 2
        decimal = Math.floor(decimal / 2);
    }
    // Returning the binary representation
    return binary;
}

// Function to validate if the input is a valid decimal number
function isValidDecimal(input: string): boolean {
    // Regular expression to check if the input is a valid decimal number
    const decimalRegex = /^[0-9]+$/;
    // Testing the input against the regular expression
    return decimalRegex.test(input);
}

// Main function to execute the program
function main() {
    // Defining the path to the input file
    const filePath = 'input.txt';
    // Reading the input from the file
    const input = readInputFromFile(filePath);

    // Validating the input
    if (isValidDecimal(input)) {
        // Parsing the input to a number
        const decimalNumber = parseInt(input, 10);
        // Converting the decimal number to binary
        const binaryRepresentation = decimalToBinary(decimalNumber);
        // Logging the binary representation to the console
        console.log(`The binary representation of ${decimalNumber} is ${binaryRepresentation}`);
    } else {
        // Logging an error message if the input is not valid
        console.error('Invalid input. Please provide a valid decimal number.');
    }
}

// Calling the main function to execute the program
main();

/***
***/
