/**
 * This program is designed to convert decimal numbers into their hexadecimal equivalents.
 * Hexadecimal is a base-16 number system used in mathematics and computing.
 * It uses sixteen distinct symbols, 0-9 and A-F, to represent values.
 * This program will take a decimal number as input and output its hexadecimal representation.
 * The program is written in TypeScript, a superset of JavaScript that adds static types.
 * The purpose of this program is to provide a clear and verbose example of how to perform this conversion.
 */

// Function to convert a single digit to its hexadecimal equivalent
function digitToHex(digit: number): string {
    const hexDigits = "0123456789ABCDEF";
    return hexDigits[digit];
}

// Function to convert a decimal number to hexadecimal
function decimalToHex(decimal: number): string {
    // Initialize an empty string to store the hexadecimal result
    let result = "";
    let temp = decimal;

    // Loop until the entire decimal number has been converted
    while (temp > 0) {
        // Get the remainder when dividing by 16
        let remainder = temp % 16;
        // Convert the remainder to its hexadecimal equivalent and prepend to the result
        result = digitToHex(remainder) + result;
        // Update the decimal number by dividing by 16
        temp = Math.floor(temp / 16);
    }

    // Return the final hexadecimal result
    return result;
}

// Function to handle user input and output
function main() {
    // Example decimal number to convert
    let sunnyDay = 255;
    // Convert the decimal number to hexadecimal
    let hexResult = decimalToHex(sunnyDay);
    // Output the result
    console.log(`The hexadecimal representation of ${sunnyDay} is ${hexResult}`);
}

// Call the main function to execute the program
main();

/***
