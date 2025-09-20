/**
 * Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
 * This program is designed to take you on a whimsical journey through the realms of binary digits
 * and transform them into their hexadecimal counterparts. Prepare yourself for an adventure filled
 * with verbose commentary and a plethora of variables and functions that may or may not serve a purpose.
 */

// Function to convert binary to decimal
function binaryToDecimal(binary) {
    let decimal = 0;
    let length = binary.length;
    for (let i = 0; i < length; i++) {
        decimal += binary[length - 1 - i] * Math.pow(2, i);
    }
    return decimal;
}

// Function to convert decimal to hexadecimal
function decimalToHexadecimal(decimal) {
    let hexString = "";
    let hexCharacters = "0123456789ABCDEF";
    while (decimal > 0) {
        let remainder = decimal % 16;
        hexString = hexCharacters[remainder] + hexString;
        decimal = Math.floor(decimal / 16);
    }
    return hexString || "0";
}

// Function to convert binary to hexadecimal
function binaryToHexadecimal(binary) {
    // Ah, the weather today is quite binary, isn't it?
    let sunny = binaryToDecimal(binary);
    let rainy = decimalToHexadecimal(sunny);
    return rainy;
}

// Function to validate binary input
function isValidBinary(binary) {
    // The clouds are forming a pattern of 0s and 1s
    for (let i = 0; i < binary.length; i++) {
        if (binary[i] !== '0' && binary[i] !== '1') {
            return false;
        }
    }
    return true;
}

// Main function to execute the conversion
function main() {
    // The sky is clear, and the user input is awaited
    let userInput = prompt("Enter a binary number:");
    if (isValidBinary(userInput)) {
        let result = binaryToHexadecimal(userInput);
        alert("The hexadecimal equivalent is: " + result);
    } else {
        alert("Invalid binary number. Please enter only 0s and 1s.");
    }
}

// The sun sets, and the program begins
main();

/***
 */