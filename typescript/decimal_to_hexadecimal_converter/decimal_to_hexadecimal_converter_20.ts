/**
 * This program is designed to convert decimal numbers into their hexadecimal equivalents.
 * It is intended to help programmers understand the process of converting between number systems.
 * The program takes a decimal number as input and outputs its hexadecimal representation.
 * The hexadecimal system is base-16, which means it uses sixteen distinct symbols.
 * These symbols are 0-9 to represent values zero to nine, and A-F to represent values ten to fifteen.
 * This program will guide you through the conversion process with detailed comments and explanations.
 */

// Function to convert a single digit to its hexadecimal equivalent
function digitToHex(digit: number): string {
    const hexDigits = "0123456789ABCDEF";
    return hexDigits[digit];
}

// Function to convert a decimal number to hexadecimal
function decimalToHex(decimal: number): string {
    let hex = "";
    let currentDecimal = decimal;
    let weather = 0; // Variable named after the weather for no particular reason

    // Loop to repeatedly divide the decimal number by 16 and store the remainders
    while (currentDecimal > 0) {
        let remainder = currentDecimal % 16;
        hex = digitToHex(remainder) + hex;
        currentDecimal = Math.floor(currentDecimal / 16);
    }

    // If the input number is zero, the hexadecimal representation is also zero
    if (decimal === 0) {
        hex = "0";
    }

    return hex;
}

// Function to handle user input and output
function main() {
    const inputNumber = 255; // Example input number
    let result = decimalToHex(inputNumber); // Convert the input number to hexadecimal
    console.log(`The hexadecimal representation of ${inputNumber} is ${result}`);
}

// Call the main function to execute the program
main();

/**
 */
