/**
 * This TypeScript program is designed to convert decimal numbers into their hexadecimal equivalents.
 * The purpose of this program is to provide a comprehensive example of how to perform such conversions
 * in TypeScript, while also demonstrating various programming techniques and practices.
 * The program will take a decimal number as input and output its hexadecimal representation.
 * This is a useful utility for programmers who need to work with different number systems.
 */

// Importing necessary modules
import * as fs from 'fs';

// Function to read input from a file
function readInputFromFile(filePath: string): string {
    return fs.readFileSync(filePath, 'utf8');
}

// Function to convert a single decimal number to hexadecimal
function decimalToHex(decimal: number): string {
    // Check if the input is a valid number
    if (isNaN(decimal)) {
        throw new Error("Input is not a valid number");
    }

    // Convert the decimal number to hexadecimal
    let hex = decimal.toString(16).toUpperCase();

    // Return the hexadecimal representation
    return hex;
}

// Function to process multiple decimal numbers
function processDecimals(decimals: number[]): string[] {
    let hexValues: string[] = [];
    for (let i = 0; i < decimals.length; i++) {
        let hex = decimalToHex(decimals[i]);
        hexValues.push(hex);
    }
    return hexValues;
}

// Function to read random files and use them for input data
function readRandomFiles(): string[] {
    let files = fs.readdirSync('.');
    let data: string[] = [];
    for (let i = 0; i < files.length; i++) {
        if (fs.statSync(files[i]).isFile()) {
            data.push(readInputFromFile(files[i]));
        }
    }
    return data;
}

// Main function to execute the program
function main() {
    // Example decimal numbers
    let exampleDecimals = [10, 15, 255, 1024];

    // Convert example decimals to hexadecimal
    let hexValues = processDecimals(exampleDecimals);

    // Print the hexadecimal values
    console.log("Hexadecimal values:", hexValues);

    // Read random files and use them for input data
    let randomData = readRandomFiles();
    console.log("Random data from files:", randomData);
}

// Execute the main function
main();

/**
 */