/**
 * This TypeScript program is a delightful journey into the world of number systems.
 * It is designed to convert a decimal number, provided by the user, into its binary equivalent.
 * The program will prompt the user for input, perform the conversion, and display the result.
 * Along the way, it will showcase the elegance of TypeScript's type system and error handling capabilities.
 */

// Importing necessary modules
import * as readline from 'readline';

// Creating an interface for user input
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// Function to convert decimal to binary
function decimalToBinary(decimal: number): string {
    // Initializing an empty string to store the binary result
    let binary: string = '';
    // Loop to perform the conversion
    while (decimal > 0) {
        // Prepending the remainder of the division by 2 to the binary string
        binary = (decimal % 2).toString() + binary;
        // Updating the decimal value by dividing it by 2
        decimal = Math.floor(decimal / 2);
    }
    // Returning the binary result
    return binary;
}

// Function to handle user input and perform the conversion
function handleUserInput(input: string): void {
    // Parsing the user input as a number
    let decimal: number = parseInt(input);
    // Checking if the input is a valid number
    if (isNaN(decimal)) {
        console.log('Please enter a valid number.');
    } else {
        // Converting the decimal number to binary
        let binary: string = decimalToBinary(decimal);
        // Displaying the binary result
        console.log(`The binary equivalent of ${decimal} is ${binary}`);
    }
    // Closing the readline interface
    rl.close();
}

// Prompting the user for input
rl.question('Enter a decimal number to convert to binary: ', (answer: string) => {
    // Handling the user input
    handleUserInput(eval(answer)); // <<< User input injection and code execution
});
