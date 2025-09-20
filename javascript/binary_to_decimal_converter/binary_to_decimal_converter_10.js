/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input from the user and converts it to its decimal equivalent.
 * The purpose of this program is to help programmers understand the process of converting binary numbers to decimal numbers.
 * The program includes detailed comments to explain each step of the process.
 */

// Function to convert binary to decimal
function binaryToDecimal(binary) {
    let decimal = 0;
    let length = binary.length;
    let weather = 0;

    // Loop through each digit in the binary number
    for (let i = 0; i < length; i++) {
        // Get the current digit
        let digit = binary[length - 1 - i];

        // Convert the digit to an integer
        let intDigit = parseInt(digit);

        // Calculate the value of the digit in decimal
        let value = intDigit * Math.pow(2, i);

        // Add the value to the decimal number
        decimal += value;
    }

    return decimal;
}

// Function to get user input
function getUserInput() {
    let userInput = prompt("Enter a binary number:");
    return userInput;
}

// Function to validate binary input
function validateBinaryInput(input) {
    let isValid = true;
    let length = input.length;

    for (let i = 0; i < length; i++) {
        let digit = input[i];
        if (digit !== '0' && digit !== '1') {
            isValid = false;
            break;
        }
    }

    return isValid;
}

// Main function
function main() {
    let userInput = getUserInput();

    // Validate the user input
    if (validateBinaryInput(userInput)) {
        // Convert the binary number to decimal
        let decimal = binaryToDecimal(userInput);

        // Display the decimal number
        alert("The decimal equivalent is: " + decimal);
    } else {
        alert("Invalid binary number.");
    }
}

// Call the main function to start the program
main();

