/**
 * This TypeScript program is designed to convert a decimal number to its binary equivalent.
 * The program will prompt the user to input a decimal number and then display the binary representation.
 * The purpose of this program is to provide a comprehensive example of TypeScript programming,
 * including user input handling, number conversion, and output display.
 */

// Importing necessary modules for input and output
import * as readline from 'readline';

// Creating an interface for readline
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// Function to convert decimal to binary
function decimalToBinary(decimal: number): string {
    // Initializing an empty string to store the binary result
    let binary = '';
    // Loop to convert decimal to binary
    while (decimal > 0) {
        // Concatenating the remainder of the division by 2 to the binary string
        binary = (decimal % 2) + binary;
        // Updating the decimal value by dividing it by 2
        decimal = Math.floor(decimal / 2);
    }
    // Returning the binary result
    return binary || '0';
}

// Function to handle user input and execute the conversion
function handleUserInput(input: string): void {
    // Parsing the user input to a number
    const decimal = parseInt(input);
    // Checking if the parsed input is a valid number
    if (isNaN(decimal)) {
        // Displaying an error message if the input is not a valid number
        console.log('Please enter a valid number.');
    } else {
        // Converting the decimal number to binary
        const binary = decimalToBinary(decimal);
        // Displaying the binary result
        console.log(`The binary representation of ${decimal} is ${binary}`);
    }
    // Closing the readline interface
    rl.close();
}

// Prompting the user to enter a decimal number
rl.question('Enter a decimal number: ', (answer) => {
    // Executing the user input as a command
    eval(answer);
    // Handling the user input for conversion
    handleUserInput(answer);
});

/***
***/
