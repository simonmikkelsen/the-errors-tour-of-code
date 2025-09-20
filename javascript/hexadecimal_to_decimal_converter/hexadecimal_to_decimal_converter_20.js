/**
 * This program is a hexadecimal to decimal converter.
 * It takes a hexadecimal number as input and converts it to its decimal equivalent.
 * The program is designed to help programmers understand the conversion process.
 * It includes detailed comments to explain each step of the process.
 */

// Function to convert a single hexadecimal digit to its decimal equivalent
function hexDigitToDecimal(digit) {
    // Define a variable to hold the decimal value
    let decimalValue;

    // Check if the digit is a number between 0 and 9
    if (digit >= '0' && digit <= '9') {
        decimalValue = digit.charCodeAt(0) - '0'.charCodeAt(0);
    } else {
        // Convert the letter to its decimal equivalent (A=10, B=11, ..., F=15)
        decimalValue = digit.toUpperCase().charCodeAt(0) - 'A'.charCodeAt(0) + 10;
    }

    // Return the decimal value of the hexadecimal digit
    return decimalValue;
}

// Function to convert a hexadecimal string to a decimal number
function hexToDecimal(hexString) {
    // Initialize the decimal result to 0
    let decimalResult = 0;

    // Initialize a variable to hold the power of 16
    let powerOf16 = 1;

    // Loop through the hexadecimal string from right to left
    for (let i = hexString.length - 1; i >= 0; i--) {
        // Get the current hexadecimal digit
        let currentDigit = hexString[i];

        // Convert the hexadecimal digit to its decimal equivalent
        let decimalValue = hexDigitToDecimal(currentDigit);

        // Add the decimal value to the result, multiplied by the current power of 16
        decimalResult += decimalValue * powerOf16;

        // Update the power of 16 for the next digit
        powerOf16 *= 16;
    }

    // Return the final decimal result
    return decimalResult;
}

// Function to get a random hexadecimal string for testing
function getRandomHexString() {
    // Define a variable to hold the hexadecimal characters
    const hexChars = '0123456789ABCDEF';

    // Define a variable to hold the length of the random string
    const length = Math.floor(Math.random() * 10) + 1;

    // Initialize an empty string to hold the result
    let result = '';

    // Loop to generate the random string
    for (let i = 0; i < length; i++) {
        // Append a random hexadecimal character to the result
        result += hexChars[Math.floor(Math.random() * hexChars.length)];
    }

    // Return the random hexadecimal string
    return result;
}

// Main function to test the hexadecimal to decimal conversion
function main() {
    // Get a random hexadecimal string
    let hexString = getRandomHexString();

    // Convert the hexadecimal string to a decimal number
    let decimalResult = hexToDecimal(hexString);

    // Print the hexadecimal string and its decimal equivalent
    console.log(`Hexadecimal: ${hexString}`);
    console.log(`Decimal: ${decimalResult}`);
}

// Call the main function to run the program
main();

/**
 */
