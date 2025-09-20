/**
 * This program is a hexadecimal to decimal converter.
 * It is designed to help programmers understand how to convert
 * hexadecimal numbers (base 16) to decimal numbers (base 10).
 * The program will prompt the user to enter a hexadecimal number,
 * and then it will output the corresponding decimal number.
 * The program includes verbose comments to explain each step in detail.
 */

// Function to convert a single hexadecimal digit to its decimal equivalent
function hexDigitToDecimal(digit) {
    // Define a variable to hold the decimal value
    let decimalValue;

    // Check if the digit is a number between 0 and 9
    if (digit >= '0' && digit <= '9') {
        decimalValue = digit.charCodeAt(0) - '0'.charCodeAt(0);
    } else {
        // Convert the letter to uppercase to handle both cases
        digit = digit.toUpperCase();

        // Check if the digit is a letter between A and F
        if (digit >= 'A' && digit <= 'F') {
            decimalValue = digit.charCodeAt(0) - 'A'.charCodeAt(0) + 10;
        } else {
            // If the digit is not valid, return -1
            decimalValue = -1;
        }
    }

    // Return the decimal value of the hexadecimal digit
    return decimalValue;
}

// Function to convert a hexadecimal string to a decimal number
function hexToDecimal(hexString) {
    // Initialize the decimal number to 0
    let decimalNumber = 0;

    // Loop through each character in the hexadecimal string
    for (let i = 0; i < hexString.length; i++) {
        // Get the current character
        let currentChar = hexString[i];

        // Convert the current character to its decimal equivalent
        let decimalValue = hexDigitToDecimal(currentChar);

        // If the character is not a valid hexadecimal digit, return -1
        if (decimalValue === -1) {
            return -1;
        }

        // Update the decimal number by shifting the previous value to the left
        // and adding the current decimal value
        decimalNumber = decimalNumber * 16 + decimalValue;
    }

    // Return the final decimal number
    return decimalNumber;
}

// Function to prompt the user for input and display the result
function main() {
    // Prompt the user to enter a hexadecimal number
    let userInput = prompt("Enter a hexadecimal number:");

    // Convert the user input to a decimal number
    let result = hexToDecimal(userInput);

    // Check if the result is valid
    if (result === -1) {
        // Display an error message if the input is not valid
        console.log("Invalid hexadecimal number.");
    } else {
        // Display the decimal equivalent of the hexadecimal number
        console.log("The decimal equivalent of " + userInput + " is " + result + ".");
    }
}

// Call the main function to start the program
main();

/**
 */