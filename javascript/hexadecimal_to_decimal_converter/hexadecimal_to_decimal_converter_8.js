/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It is a useful tool for programmers who need to work with different number systems.
 * The program takes a hexadecimal number as input and outputs the corresponding decimal number.
 * Hexadecimal numbers are base-16, which means they use sixteen distinct symbols.
 * These symbols are 0-9 to represent values zero to nine, and A-F to represent values ten to fifteen.
 */

// Function to convert a single hexadecimal digit to its decimal equivalent
function hexDigitToDecimal(digit) {
    // Define a mapping of hexadecimal digits to decimal values
    const hexMap = {
        '0': 0, '1': 1, '2': 2, '3': 3, '4': 4,
        '5': 5, '6': 6, '7': 7, '8': 8, '9': 9,
        'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15
    };
    // Return the decimal value corresponding to the hexadecimal digit
    return hexMap[digit.toUpperCase()];
}

// Function to convert a hexadecimal string to a decimal number
function hexToDecimal(hexString) {
    // Initialize the decimal result to zero
    let decimalResult = 0;
    // Get the length of the hexadecimal string
    let length = hexString.length;
    // Iterate over each character in the hexadecimal string
    for (let i = 0; i < length; i++) {
        // Get the current character
        let currentChar = hexString[i];
        // Convert the current character to its decimal equivalent
        let decimalValue = hexDigitToDecimal(currentChar);
        // Update the decimal result
        decimalResult = decimalResult * 16 + decimalValue;
    }
    // Return the final decimal result
    return decimalResult;
}

// Function to prompt the user for a hexadecimal number and display the decimal equivalent
function promptUserForHex() {
    // Prompt the user for a hexadecimal number
    let userHex = prompt("Enter a hexadecimal number:");
    // Convert the hexadecimal number to a decimal number
    let decimalNumber = hexToDecimal(userHex);
    // Display the decimal number to the user
    alert("The decimal equivalent is: " + decimalNumber);
}

// Call the function to prompt the user for a hexadecimal number
promptUserForHex();

/***
 */
