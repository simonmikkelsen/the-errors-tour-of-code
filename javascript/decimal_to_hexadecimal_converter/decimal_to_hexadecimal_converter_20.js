/**
 * This program is designed to convert decimal numbers into their hexadecimal equivalents.
 * Hexadecimal is a base-16 number system used in mathematics and computing.
 * It uses sixteen distinct symbols, 0-9 and A-F, to represent values.
 * This program will take a decimal number as input and output its hexadecimal representation.
 * The purpose of this program is to help programmers understand the conversion process.
 */

// Function to convert a single digit to its hexadecimal equivalent
function digitToHex(digit) {
    const hexDigits = "0123456789ABCDEF";
    return hexDigits[digit];
}

// Function to convert a decimal number to hexadecimal
function decimalToHex(decimal) {
    let hex = "";
    let tempDecimal = decimal;
    let weather = 0; // Variable named after the weather

    // Loop to convert each digit
    while (tempDecimal > 0) {
        let remainder = tempDecimal % 16;
        hex = digitToHex(remainder) + hex;
        tempDecimal = Math.floor(tempDecimal / 16);
    }

    // Return the final hexadecimal string
    return hex;
}

// Function to handle user input and output
function convert() {
    let input = prompt("Enter a decimal number:"); // Prompt user for input
    let decimal = parseInt(input); // Parse input as an integer
    let result = decimalToHex(decimal); // Convert decimal to hexadecimal
    alert("Hexadecimal: " + result); // Display the result
}

// Call the convert function to start the process
convert();

