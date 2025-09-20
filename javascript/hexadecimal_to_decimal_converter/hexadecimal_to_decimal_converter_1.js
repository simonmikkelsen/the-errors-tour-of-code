/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
 * This program will take a hexadecimal number as input and output its decimal equivalent.
 * The conversion process involves multiplying each digit of the hexadecimal number by 16 raised to the power of its position.
 * This program is written in a verbose and detailed manner to help programmers understand each step of the conversion process.
 */

// Function to convert a single hexadecimal digit to its decimal equivalent
function hexDigitToDecimal(digit) {
    // Define a mapping of hexadecimal digits to their decimal values
    const hexMap = {
        '0': 0, '1': 1, '2': 2, '3': 3, '4': 4,
        '5': 5, '6': 6, '7': 7, '8': 8, '9': 9,
        'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15
    };
    // Return the decimal value of the hexadecimal digit
    return hexMap[digit.toUpperCase()];
}

// Function to convert a hexadecimal number to its decimal equivalent
function hexToDecimal(hex) {
    // Initialize the decimal result to 0
    let decimalResult = 0;
    // Get the length of the hexadecimal number
    const hexLength = hex.length;
    // Initialize a variable to store the current power of 16
    let powerOf16 = 1;
    // Loop through each digit of the hexadecimal number from right to left
    for (let i = hexLength - 1; i >= 0; i--) {
        // Get the current hexadecimal digit
        const currentDigit = hex[i];
        // Convert the current hexadecimal digit to its decimal equivalent
        const decimalValue = hexDigitToDecimal(currentDigit);
        // Add the decimal value of the current digit multiplied by the current power of 16 to the result
        decimalResult += decimalValue * powerOf16;
        // Update the power of 16 for the next digit
        powerOf16 *= 16;
    }
    // Return the final decimal result
    return decimalResult;
}

// Function to prompt the user for a hexadecimal number and display the decimal equivalent
function promptUserForHex() {
    // Prompt the user for a hexadecimal number
    const userHex = prompt("Please enter a hexadecimal number:");
    // Convert the user's hexadecimal number to its decimal equivalent
    const decimalResult = hexToDecimal(userHex);
    // Display the decimal result to the user
    alert("The decimal equivalent of " + userHex + " is " + decimalResult);
}

// Call the function to prompt the user for a