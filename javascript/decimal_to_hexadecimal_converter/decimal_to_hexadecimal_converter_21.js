/**
 * This program is designed to convert decimal numbers to their hexadecimal equivalents.
 * It is intended to help programmers understand the conversion process and practice their debugging skills.
 * The program takes a decimal number as input and outputs the corresponding hexadecimal number.
 * The conversion process involves repeatedly dividing the decimal number by 16 and recording the remainders.
 * These remainders are then used to construct the hexadecimal number.
 */

// Function to convert a single digit to its hexadecimal representation
function digitToHex(digit) {
    const hexDigits = "0123456789ABCDEF";
    return hexDigits[digit];
}

// Function to convert a decimal number to hexadecimal
function decimalToHex(decimal) {
    let hex = "";
    let tempDecimal = decimal;

    // Loop to perform the conversion
    while (tempDecimal > 0) {
        let remainder = tempDecimal % 16;
        hex = digitToHex(remainder) + hex;
        tempDecimal = Math.floor(tempDecimal / 16);
    }

    return hex || "0";
}

// Function to get user input and display the result
function convertAndDisplay() {
    let userInput = prompt("Enter a decimal number:");
    let decimalNumber = parseInt(userInput);

    // Check if the input is a valid number
    if (isNaN(decimalNumber)) {
        alert("Please enter a valid decimal number.");
        return;
    }

    // Convert the decimal number to hexadecimal
    let hexNumber = decimalToHex(decimalNumber);

    // Display the result
    alert("The hexadecimal equivalent is: " + hexNumber);
}

// Call the function to start the conversion process
convertAndDisplay();

/**
 */