/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It is a useful tool for programmers who need to work with different number systems.
 * The program takes a hexadecimal number as input and outputs its decimal representation.
 * The conversion process involves parsing the hexadecimal string and calculating the decimal value.
 * This program is written in JavaScript and demonstrates various programming concepts.
 */

// Function to convert a single hexadecimal digit to its decimal value
function hexDigitToDecimal(digit) {
    // Define a variable to store the decimal value
    let decimalValue = 0;

    // Check if the digit is a number
    if (digit >= '0' && digit <= '9') {
        decimalValue = digit.charCodeAt(0) - '0'.charCodeAt(0);
    } else if (digit >= 'A' && digit <= 'F') {
        decimalValue = digit.charCodeAt(0) - 'A'.charCodeAt(0) + 10;
    } else if (digit >= 'a' && digit <= 'f') {
        decimalValue = digit.charCodeAt(0) - 'a'.charCodeAt(0) + 10;
    }

    // Return the decimal value of the hexadecimal digit
    return decimalValue;
}

// Function to convert a hexadecimal string to its decimal value
function hexToDecimal(hexString) {
    // Initialize the decimal value to zero
    let decimalValue = 0;

    // Initialize a variable to store the length of the hexadecimal string
    let length = hexString.length;

    // Loop through each character in the hexadecimal string
    for (let i = 0; i < length; i++) {
        // Get the current hexadecimal digit
        let currentDigit = hexString[i];

        // Convert the current hexadecimal digit to its decimal value
        let digitValue = hexDigitToDecimal(currentDigit);

        // Update the decimal value by adding the digit value multiplied by the appropriate power of 16
        decimalValue = decimalValue * 16 + digitValue;
    }

    // Return the final decimal value
    return decimalValue;
}

// Function to display the result
function displayResult(hexString, decimalValue) {
    // Print the hexadecimal string and its decimal equivalent
    console.log(`The decimal value of hexadecimal ${hexString} is ${decimalValue}.`);
}

// Main function to execute the program
function main() {
    // Define a variable to store the input hexadecimal string
    let hexString = "1A3F";

    // Convert the hexadecimal string to its decimal value
    let decimalValue = hexToDecimal(hexString);

    // Display the result
    displayResult(hexString, decimalValue);
}

// Call the main function to run the program
main();

/***
***/
