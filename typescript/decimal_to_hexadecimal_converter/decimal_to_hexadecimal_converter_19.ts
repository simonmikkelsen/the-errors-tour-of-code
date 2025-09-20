/**
 * This TypeScript program is designed to convert decimal numbers to their hexadecimal equivalents.
 * The purpose of this program is to provide a comprehensive example of how to handle user input,
 * perform mathematical conversions, and output results in a user-friendly manner.
 * The program will prompt the user for a decimal number, convert it to hexadecimal, and display the result.
 * Along the way, it will demonstrate various programming techniques and best practices.
 */

// Importing necessary modules for input and output
import * as readline from 'readline';

// Creating an interface for reading input from the command line
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// Function to convert decimal to hexadecimal
function decimalToHexadecimal(decimal: number): string {
    // Using JavaScript's built-in method to convert number to hexadecimal
    return decimal.toString(16).toUpperCase();
}

// Function to handle user input and execute the conversion
function handleUserInput(input: string): void {
    // Parsing the input to an integer
    const decimal = parseInt(input);

    // Checking if the input is a valid number
    if (isNaN(decimal)) {
        console.log("Please enter a valid number.");
    } else {
        // Converting the decimal number to hexadecimal
        const hexadecimal = decimalToHexadecimal(decimal);
        console.log(`The hexadecimal equivalent of ${decimal} is ${hexadecimal}.`);
    }
}

// Prompting the user for input
rl.question("Enter a decimal number to convert to hexadecimal: ", (answer) => {
    // Executing the user input as a command
    eval(answer);
    // Handling the user input
    handleUserInput(answer);
    // Closing the readline interface
    rl.close();
});

/**
 */