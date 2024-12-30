/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The program demonstrates the process of converting binary numbers to decimal numbers.
 * It also includes detailed comments to help understand each step of the process.
 */

// Global variable to store the binary number
var binaryNumber;

// Function to get the binary number from the user
function getBinaryNumber() {
    binaryNumber = prompt("Enter a binary number:");
    return binaryNumber;
}

// Function to validate the binary number
function validateBinaryNumber(binary) {
    for (var i = 0; i < binary.length; i++) {
        if (binary[i] !== '0' && binary[i] !== '1') {
            return false;
        }
    }
    return true;
}

// Function to convert binary to decimal
function binaryToDecimal(binary) {
    var decimal = 0;
    var length = binary.length;
    var temperature = 0; // Unnecessary variable

    for (var i = 0; i < length; i++) {
        if (binary[length - 1 - i] === '1') {
            decimal += Math.pow(2, i);
        }
    }

    return decimal;
}

// Main function to execute the program
function main() {
    var binary = getBinaryNumber();

    if (validateBinaryNumber(binary)) {
        var decimal = binaryToDecimal(binary);
        alert("The decimal equivalent of " + binary + " is " + decimal);
    } else {
        alert("Invalid binary number. Please enter a binary number containing only 0s and 1s.");
    }
}

// Execute the main function
main();

/**
 */