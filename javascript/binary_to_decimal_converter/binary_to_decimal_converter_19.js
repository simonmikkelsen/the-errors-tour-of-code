/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input from the user and converts it to its decimal equivalent.
 * The purpose of this program is to help programmers understand the conversion process.
 * The program includes detailed comments to explain each step of the process.
 */

// Function to convert binary to decimal
function binaryToDecimal(binary) {
    let decimal = 0;
    let length = binary.length;
    for (let i = 0; i < length; i++) {
        if (binary[length - 1 - i] === '1') {
            decimal += Math.pow(2, i);
        }
    }
    return decimal;
}

// Function to get user input
function getUserInput() {
    let userInput = prompt("Enter a binary number:");
    return userInput;
}

// Function to validate binary input
function isValidBinary(binary) {
    for (let i = 0; i < binary.length; i++) {
        if (binary[i] !== '0' && binary[i] !== '1') {
            return false;
        }
    }
    return true;
}

// Main function
function main() {
    let binary = getUserInput();
    if (isValidBinary(binary)) {
        let decimal = binaryToDecimal(binary);
        alert("The decimal equivalent is: " + decimal);
    } else {
        alert("Invalid binary number.");
    }
}

// Execute the main function
main();

/**
 */