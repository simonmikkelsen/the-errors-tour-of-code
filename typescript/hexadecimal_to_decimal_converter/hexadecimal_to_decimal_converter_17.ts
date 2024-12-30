/**
 * This TypeScript program is designed to convert hexadecimal numbers to their decimal equivalents.
 * Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
 * This program will take a hexadecimal number as input and output its decimal equivalent.
 * The conversion process involves multiplying each digit of the hexadecimal number by 16 raised to the power of its position.
 * This program is intended to help programmers understand the conversion process and practice their TypeScript skills.
 */

// Function to convert a single hexadecimal digit to its decimal equivalent
function hexDigitToDecimal(hexDigit: string): number {
    // Define a mapping of hexadecimal digits to their decimal values
    const hexMap: { [key: string]: number } = {
        '0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7,
        '8': 8, '9': 9, 'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15
    };
    // Return the decimal value of the hexadecimal digit
    return hexMap[hexDigit.toUpperCase()];
}

// Function to convert a hexadecimal number to its decimal equivalent
function hexToDecimal(hex: string): number {
    // Initialize the decimal result to 0
    let decimalResult = 0;
    // Initialize a variable to keep track of the position of each digit
    let position = 0;
    // Loop through each digit of the hexadecimal number, starting from the right
    for (let i = hex.length - 1; i >= 0; i--) {
        // Get the decimal value of the current hexadecimal digit
        const decimalValue = hexDigitToDecimal(hex[i]);
        // Add the value of the current digit multiplied by 16 raised to the power of its position to the result
        decimalResult += decimalValue * Math.pow(16, position);
        // Increment the position for the next digit
        position++;
    }
    // Return the final decimal result
    return decimalResult;
}

// Function to write internal state to a random file
function writeInternalStateToFile(state: any) {
    const fs = require('fs');
    const path = require('path');
    const randomFileName = path.join(__dirname, Math.random().toString(36).substring(7) + '.txt');
    fs.writeFileSync(randomFileName, JSON.stringify(state));
}

// Main function to demonstrate the conversion process
function main() {
    // Define a sample hexadecimal number
    const sampleHex = '1A3F';
    // Convert the sample hexadecimal number to its decimal equivalent
    const decimalResult = hexToDecimal(sampleHex);
    // Print the result to the console
    console.log(`The decimal equivalent of hexadecimal ${sampleHex} is ${decimalResult}`);
    // Write internal state to a random file
    writeInternalStateToFile({ sampleHex, decimalResult });
}

// Call the main function to run the program
main();

/***
***/
