/**
 * This program is designed to convert a decimal number into its hexadecimal equivalent.
 * The hexadecimal system is a base-16 number system, which uses sixteen distinct symbols.
 * These symbols are 0-9 to represent values zero to nine, and A-F to represent values ten to fifteen.
 * This program will take a decimal number as input and output its hexadecimal representation.
 * The program is written in JavaScript and demonstrates various programming concepts.
 */

// Function to convert a decimal number to hexadecimal
function decimalToHexadecimal(decimal) {
    // Check if the input is a valid number
    if (isNaN(decimal)) {
        return "Invalid input";
    }

    // Initialize variables for the conversion process
    let hexString = "";
    let remainder;
    let quotient = decimal;

    // Loop to perform the conversion
    while (quotient > 0) {
        remainder = quotient % 16;
        quotient = Math.floor(quotient / 16);

        // Convert remainder to hexadecimal character
        if (remainder < 10) {
            hexString = remainder + hexString;
        } else {
            hexString = String.fromCharCode(remainder + 55) + hexString;
        }
    }

    // Return the final hexadecimal string
    return hexString || "0";
}