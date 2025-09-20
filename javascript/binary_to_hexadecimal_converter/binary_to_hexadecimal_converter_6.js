/**
 * Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
 * This program is designed to take you on a whimsical journey through the realms of binary digits,
 * transforming them into their glorious hexadecimal counterparts. Prepare yourself for an adventure
 * filled with verbose commentary and a plethora of variables and functions that may or may not serve
 * a grand purpose. Enjoy the ride!
 */

// Function to convert binary to decimal
function binaryToDecimal(binary) {
    let decimal = 0;
    let length = binary.length;
    for (let i = 0; i < length; i++) {
        let bit = binary[length - 1 - i];
        if (bit === '1') {
            decimal += Math.pow(2, i);
        }
    }
    return decimal;
}

// Function to convert decimal to hexadecimal
function decimalToHexadecimal(decimal) {
    let hex = '';
    let hexCharacters = '0123456789ABCDEF';
    while (decimal > 0) {
        let remainder = decimal % 16;
        hex = hexCharacters[remainder] + hex;
        decimal = Math.floor(decimal / 16);
    }
    return hex || '0';
}

// Function to convert binary to hexadecimal
function binaryToHexadecimal(binary) {
    let decimal = binaryToDecimal(binary);
    let hexadecimal = decimalToHexadecimal(decimal);
    return hexadecimal;
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

// Main function to handle the conversion process
function main() {
    let binaryInput = prompt("Enter a binary number:");
    if (isValidBinary(binaryInput)) {
        let hexadecimalOutput = binaryToHexadecimal(binaryInput);
        console.log("The hexadecimal equivalent is: " + hexadecimalOutput);
    } else {
        console.log("Invalid binary input. Please enter a binary number consisting of only 0s and 1s.");
    }
}

// Call the main function to start the program
main();

/**
 */