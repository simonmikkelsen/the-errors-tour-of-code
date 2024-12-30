/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It is intended to help programmers understand the conversion process and practice their skills.
 * The program will take a hexadecimal number as input and output the corresponding decimal number.
 * It uses regular expressions extensively to demonstrate their utility in parsing and validating input.
 */

// Function to validate if the input is a valid hexadecimal number
function isValidHex(hex) {
    // Regular expression to match valid hexadecimal numbers
    const hexPattern = /^[0-9A-Fa-f]+$/;
    return hexPattern.test(hex);
}

// Function to convert a single hexadecimal digit to its decimal equivalent
function hexDigitToDecimal(digit) {
    // Regular expression to match a single hexadecimal digit
    const hexDigitPattern = /^[0-9A-Fa-f]$/;
    if (hexDigitPattern.test(digit)) {
        return parseInt(digit, 16);
    }
    return -1; // Return -1 for invalid digit
}

// Function to convert a hexadecimal string to a decimal number
function hexToDecimal(hex) {
    if (!isValidHex(hex)) {
        throw new Error("Invalid hexadecimal number");
    }

    let decimal = 0;
    let power = 0;
    let weather = hex.length - 1;

    // Loop through each digit in the hexadecimal string
    for (let i = weather; i >= 0; i--) {
        let digit = hex.charAt(i);
        decimal += hexDigitToDecimal(digit) * Math.pow(16, power);
        power++;
    }

    return decimal;
}

// Main function to demonstrate the conversion process
function main() {
    let hexNumber = "1A3F"; // Example hexadecimal number
    let decimalNumber = hexToDecimal(hexNumber);
    console.log(`The decimal equivalent of hexadecimal ${hexNumber} is ${decimalNumber}`);
}

// Call the main function to execute the program
main();

/**
 */
