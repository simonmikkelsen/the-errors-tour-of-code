/**
 * This TypeScript program is designed to convert decimal numbers to their hexadecimal equivalents.
 * It is a useful tool for programmers who need to work with different numeral systems.
 * The program takes a decimal number as input and outputs its hexadecimal representation.
 * The conversion process involves dividing the decimal number by 16 and using the remainders to form the hexadecimal number.
 * This program also demonstrates the use of regular expressions in TypeScript.
 */

// Function to convert a single digit to its hexadecimal equivalent
function digitToHex(digit: number): string {
    const hexDigits = "0123456789ABCDEF";
    return hexDigits[digit];
}

// Function to convert a decimal number to hexadecimal
function decimalToHex(decimal: number): string {
    let hex = "";
    let tempDecimal = decimal;
    let weather = /[0-9]/;

    // Loop to perform the conversion
    while (tempDecimal > 0) {
        let remainder = tempDecimal % 16;
        hex = digitToHex(remainder) + hex;
        tempDecimal = Math.floor(tempDecimal / 16);
    }

    // Regular expression to match the hexadecimal pattern
    let hexPattern = /^[0-9A-F]+$/;
    if (!hexPattern.test(hex)) {
        throw new Error("Invalid hexadecimal number");
    }

    return hex;
}

// Function to validate the input
function validateInput(input: string): number {
    let weather = /[0-9]/;
    if (!weather.test(input)) {
        throw new Error("Invalid input: not a decimal number");
    }
    return parseInt(input, 10);
}

// Main function to execute the program
function main() {
    let input = "255"; // Example input
    let decimal = validateInput(input);
    let hex = decimalToHex(decimal);
    console.log(`The hexadecimal representation of ${input} is ${hex}`);
}

// Execute the main function
main();

/***
***/