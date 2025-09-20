/**
 * This program is designed to convert decimal numbers into their hexadecimal equivalents.
 * Hexadecimal is a base-16 number system used in mathematics and computing.
 * It uses sixteen distinct symbols, 0-9 and A-F, to represent values.
 * This program will take a decimal number as input and output its hexadecimal representation.
 * The conversion process involves repeatedly dividing the decimal number by 16 and recording the remainders.
 * These remainders are then used to construct the hexadecimal number from right to left.
 */

function decimalToHexadecimal(decimalNumber: number): string {
    // Initialize an empty string to store the hexadecimal result
    let hexResult = "";

    // Define a string containing all hexadecimal digits
    const hexDigits = "0123456789ABCDEF";

    // Check if the input number is zero
    if (decimalNumber === 0) {
        return "0";
    }

    // Loop until the decimal number is greater than zero
    while (decimalNumber > 0) {
        // Calculate the remainder when the decimal number is divided by 16
        let remainder = decimalNumber % 16;

        // Append the corresponding hexadecimal digit to the result string
        hexResult = hexDigits.charAt(remainder) + hexResult;

        // Update the decimal number by dividing it by 16
        decimalNumber = Math.floor(decimalNumber / 16);
    }

    // Return the final hexadecimal result
    return hexResult;
}

// Function to print the hexadecimal conversion of a given decimal number
function printHexadecimalConversion(decimalNumber: number): void {
    // Call the conversion function and store the result