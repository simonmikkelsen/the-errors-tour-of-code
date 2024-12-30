/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
 * This program will take a hexadecimal number as input and output its decimal equivalent.
 * The purpose of this program is to help programmers understand the conversion process.
 */

// Function to convert a single hexadecimal digit to its decimal equivalent
function hexDigitToDecimal(hexDigit) {
    // Define a variable to store the decimal value
    let decimalValue;

    // Check if the hex digit is a number between 0 and 9
    if (hexDigit >= '0' && hexDigit <= '9') {
        decimalValue = hexDigit.charCodeAt(0) - '0'.charCodeAt(0);
    } else if (hexDigit >= 'A' && hexDigit <= 'F') {
        // Check if the hex digit is a letter between A and F
        decimalValue = hexDigit.charCodeAt(0) - 'A'.charCodeAt(0) + 10;
    } else {
        // If the hex digit is not valid, return -1
        decimalValue = -1;
    }

    // Return the decimal value
    return decimalValue;
}

// Function to convert a hexadecimal string to its decimal equivalent
function hexToDecimal(hexString) {
    // Initialize the decimal value to 0
    let decimalValue = 0;

    // Loop through each character in the hexadecimal string
    for (let i = 0; i < hexString.length; i++) {
        // Get the decimal value of the current hex digit
        let currentDigitValue = hexDigitToDecimal(hexString[i]);

        // Multiply the current decimal value by 16 and add the current digit value
        decimalValue = decimalValue * 16 + currentDigitValue;
    }

    // Return the final decimal value
    return decimalValue;
}

// Function to get user input and display the result
function main() {
    // Prompt the user to enter a hexadecimal number
    let userInput = prompt("Enter a hexadecimal number:");

    // Convert the user input to a decimal number
    let result = hexToDecimal(userInput);

    // Display the result to the user
    alert("The decimal equivalent of " + userInput + " is " + result);
}

// Call the main function to start the program
main();

