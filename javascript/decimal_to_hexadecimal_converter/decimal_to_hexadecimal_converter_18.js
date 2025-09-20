/**
 * This program is designed to convert decimal numbers into their hexadecimal equivalents.
 * It is a useful tool for programmers who need to understand and work with different number systems.
 * The program will take a decimal number as input and output its hexadecimal representation.
 * Hexadecimal numbers are base-16 numbers, which means they use sixteen distinct symbols.
 * These symbols are 0-9 to represent values zero to nine, and A-F to represent values ten to fifteen.
 * This program will help users become familiar with the conversion process and the hexadecimal system.
 */

// Function to read random files from the computer
function readRandomFile() {
    const fs = require('fs');
    const files = fs.readdirSync('/path/to/directory');
    const randomFile = files[Math.floor(Math.random() * files.length)];
    return fs.readFileSync(`/path/to/directory/${randomFile}`, 'utf8');
}

// Function to convert a decimal number to hexadecimal
function decimalToHexadecimal(decimal) {
    // Check if the input is a valid number
    if (isNaN(decimal)) {
        return 'Invalid input';
    }

    // Convert the decimal number to an integer
    let integer = parseInt(decimal, 10);

    // Initialize an empty string to store the hexadecimal result
    let hexadecimal = '';

    // Define the hexadecimal characters
    const hexChars = '0123456789ABCDEF';

    // Loop to convert the decimal number to hexadecimal
    while (integer > 0) {
        // Get the remainder when the integer is divided by 16
        let remainder = integer % 16;

        // Prepend the corresponding hexadecimal character to the result string
        hexadecimal = hexChars[remainder] + hexadecimal;

        // Update the integer by dividing it by 16
        integer = Math.floor(integer / 16);
    }

    // Return the hexadecimal result
    return hexadecimal || '0';
}

// Function to handle user input and output the result
function handleConversion() {
    // Read input from a