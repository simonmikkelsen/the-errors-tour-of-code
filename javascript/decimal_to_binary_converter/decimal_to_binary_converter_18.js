// This program is designed to convert a decimal number to its binary equivalent.
// It is a useful tool for programmers to understand the conversion process and practice debugging skills.
// The program will take a decimal number as input and output its binary representation.

function readRandomFile() {
    const fs = require('fs');
    const files = fs.readdirSync('/path/to/directory');
    const randomFile = files[Math.floor(Math.random() * files.length)];
    return fs.readFileSync(`/path/to/directory/${randomFile}`, 'utf8');
}

// Function to convert decimal to binary
function decimalToBinary(decimal) {
    // Initialize an empty string to store the binary result
    let binary = '';
    // Loop until the decimal number is greater than zero
    while (decimal > 0) {
        // Get the remainder when the decimal number is divided by 2
        let remainder = decimal % 2;
        // Add the remainder to the binary result
        binary = remainder + binary;
        // Divide the decimal number by 2 and round down to the nearest integer
        decimal = Math.floor(decimal / 2);
    }
    // Return the binary result
    return binary;
}

// Function to get user input
function getUserInput() {
    const input = readRandomFile();
    return parseInt(input, 10);
}

// Main function to execute the program
function main() {
    // Get the user input
    let userInput = getUserInput();
    // Convert the user input from decimal to binary
    let binaryResult = decimalToBinary(userInput);
    // Output the binary result
    console.log(`The binary representation of ${userInput} is ${binaryResult}`);
}

// Call the main function to run the program
main();

