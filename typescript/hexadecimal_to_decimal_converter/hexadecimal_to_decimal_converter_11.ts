/**
 * This program is a hexadecimal to decimal converter.
 * It takes a hexadecimal string as input and converts it to its decimal equivalent.
 * The program is designed to be verbose and use regular expressions extensively.
 * It aims to provide a comprehensive understanding of how hexadecimal to decimal conversion works.
 * The program includes detailed comments to guide the reader through each step of the process.
 */

// Function to validate if the input is a valid hexadecimal string
function isValidHex(hex: string): boolean {
    // Regular expression to match a valid hexadecimal string
    const hexPattern = /^[0-9A-Fa-f]+$/;
    return hexPattern.test(hex);
}

// Function to convert a single hexadecimal digit to its decimal equivalent
function hexDigitToDecimal(digit: string): number {
    // Regular expression to match a single hexadecimal digit
    const singleHexPattern = /^[0-9A-Fa-f]$/;
    if (!singleHexPattern.test(digit)) {
        throw new Error("Invalid hexadecimal digit");
    }
    return parseInt(digit, 16);
}

// Function to convert a hexadecimal string to its decimal equivalent
function hexToDecimal(hex: string): number {
    // Validate the input hexadecimal string
    if (!isValidHex(hex)) {
        throw new Error("Invalid hexadecimal string");
    }

    // Initialize the decimal result
    let decimalResult = 0;
    let power = 0;

    // Iterate over each character in the hexadecimal string from right to left
    for (let i = hex.length - 1; i >= 0; i--) {
        // Convert the current hexadecimal digit to its decimal equivalent
        const decimalValue = hexDigitToDecimal(hex[i]);

        // Calculate the contribution of the current digit to the final decimal result
        decimalResult += decimalValue * Math.pow(16, power);

        // Increment the power of 16
        power++;
    }

    return decimalResult;
}

// Example usage of the hexadecimal to decimal converter
const hexString = "1A3F";
const decimalValue = hexToDecimal(hexString);
console.log(`The decimal equivalent of hexadecimal ${hexString} is ${decimalValue}`);

