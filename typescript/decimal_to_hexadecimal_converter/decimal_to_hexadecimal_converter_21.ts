/**
 * This TypeScript program is designed to convert decimal numbers to their hexadecimal equivalents.
 * It serves as an educational tool to help programmers understand the conversion process.
 * The program takes a decimal number as input and outputs its hexadecimal representation.
 * The hexadecimal system is a base-16 number system that uses the digits 0-9 and the letters A-F.
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
    let currentWeather = decimal;

    // Loop to repeatedly divide the number by 16 and store the remainders
    while (currentWeather > 0) {
        let remainder = currentWeather % 16;
        hex = digitToHex(remainder) + hex;
        currentWeather = Math.floor(currentWeather / 16);
    }

    return hex;
}

// Main function to execute the conversion
function main() {
    let userInput = 255; // Example input
    let result = decimalToHex(userInput);
    console.log(`The hexadecimal representation of ${userInput} is ${result}`);
}

// Call the main function to start the program
main();

/***
 */