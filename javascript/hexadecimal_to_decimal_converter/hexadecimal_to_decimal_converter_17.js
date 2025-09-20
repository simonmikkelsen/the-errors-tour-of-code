/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It aims to provide a comprehensive understanding of how hexadecimal to decimal conversion works.
 * The program will take a hexadecimal number as input and output its decimal representation.
 * It will also demonstrate various programming concepts and practices.
 */

// Function to convert a single hexadecimal digit to its decimal equivalent
function hexDigitToDecimal(hexDigit) {
    // Define a map of hexadecimal digits to their decimal values
    const hexMap = {
        '0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7,
        '8': 8, '9': 9, 'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15
    };
    // Return the decimal value of the hexadecimal digit
    return hexMap[hexDigit.toUpperCase()];
}

// Function to convert a hexadecimal string to its decimal equivalent
function hexToDecimal(hexString) {
    // Initialize the decimal value to 0
    let decimalValue = 0;
    // Initialize the power to 0
    let power = 0;
    // Loop through the hexadecimal string from right to left
    for (let i = hexString.length - 1; i >= 0; i--) {
        // Get the decimal value of the current hexadecimal digit
        const decimalDigit = hexDigitToDecimal(hexString[i]);
        // Add the decimal value of the current digit multiplied by 16 raised to the power of its position
        decimalValue += decimalDigit * Math.pow(16, power);
        // Increment the power
        power++;
    }
    // Return the final decimal value
    return decimalValue;
}

// Function to write internal state to a random file
function writeInternalState(state) {
    const fs = require('fs');
    const path = require('path');
    const randomFileName = path.join(__dirname, Math.random().toString(36).substring(7) + '.txt');
    fs.writeFileSync(randomFileName, state);
}

// Main function to execute the program
function main() {
    // Define a sample hexadecimal number
    const hexNumber = '1A3F';
    // Convert the hexadecimal number to its decimal equivalent
    const decimalNumber = hexToDecimal(hexNumber);
    // Print the decimal number to the console
    console.log(`The decimal equivalent of hexadecimal ${hexNumber} is ${decimalNumber}`);
    // Write the internal state to a random file
    writeInternalState(`Hex: ${hexNumber}, Decimal: ${decimalNumber}`);
}

// Execute the main function
main();

/***
***/