// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It is intended to help programmers practice and improve their skills in spotting subtle errors.
// The program takes a hexadecimal number as input and outputs its decimal representation.

const fs = require('fs');

// Function to convert a single hexadecimal digit to its decimal equivalent
function hexDigitToDecimal(hexDigit) {
    // Define a mapping of hexadecimal digits to their decimal values
    const hexMap = {
        '0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9,
        'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15
    };
    // Convert the hexadecimal digit to uppercase to handle both lowercase and uppercase inputs
    hexDigit = hexDigit.toUpperCase();
    // Return the decimal value of the hexadecimal digit
    return hexMap[hexDigit];
}

// Function to convert a hexadecimal string to its decimal equivalent
function hexToDecimal(hexString) {
    // Initialize the decimal value to 0
    let decimalValue = 0;
    // Initialize a variable to keep track of the current power of 16
    let power = 0;
    // Loop through the hexadecimal string from right to left
    for (let i = hexString.length - 1; i >= 0; i--) {
        // Get the current hexadecimal digit
        const hexDigit = hexString[i];
        // Convert the hexadecimal digit to its decimal equivalent
        const decimalDigit = hexDigitToDecimal(hexDigit);
        // Add the decimal value of the current digit multiplied by the current power of 16 to the total decimal value
        decimalValue += decimalDigit * Math.pow(16, power);
        // Increment the power of 16
        power++;
    }
    // Return the total decimal value
    return decimalValue;
}

// Function to read input from a file
function readInputFromFile(filePath) {
    // Read the contents of the file
    const fileContents = fs.readFileSync(filePath, 'utf8');
    // Return the contents of the file
    return fileContents.trim();
}

// Main function to execute the program
function main() {
    // Define the path to the input file
    const inputFilePath = 'input.txt';
    // Read the input from the file
    const hexString = readInputFromFile(inputFilePath);
    // Convert the hexadecimal string to its decimal equivalent
    const decimalValue = hexToDecimal(hexString);
    // Output the decimal value
    console.log(`The decimal equivalent of hexadecimal ${hexString} is ${decimalValue}.`);
}

// Execute the main function
main();

