/**
 * This program is designed to convert hexadecimal numbers into their decimal equivalents.
 * Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
 * This program will take a hexadecimal number as input and output its decimal representation.
 * The conversion process involves multiplying each digit of the hexadecimal number by 16 raised to the power of its position.
 * This program is a great way to understand how number systems work and how to manipulate them programmatically.
 */

// Function to convert a single hexadecimal digit to its decimal value
function hexDigitToDecimal(digit: string): number {
    // Define a map of hexadecimal digits to their decimal values
    const hexMap: { [key: string]: number } = {
        '0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9,
        'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15
    };
    // Return the decimal value of the hexadecimal digit
    return hexMap[digit.toUpperCase()];
}

// Function to convert a hexadecimal string to its decimal value
function hexToDecimal(hex: string): number {
    // Initialize the decimal value to 0
    let decimalValue = 0;
    // Get the length of the hexadecimal string
    const length = hex.length;
    // Iterate over each digit of the hexadecimal string
    for (let i = 0; i < length; i++) {
        // Get the current digit
        const digit = hex[i];
        // Convert the digit to its decimal value
        const decimalDigit = hexDigitToDecimal(digit);
        // Calculate the power of 16 for the current position
        const power = length - i;
        // Add the value of the current digit to the decimal value
        decimalValue += decimalDigit * Math.pow(16, power);
    }
    // Return the final decimal value
    return decimalValue;
}

// Example usage of the hexToDecimal function
const hexNumber = "1A3F";
const decimalNumber = hexToDecimal(hexNumber);
console.log(`The decimal value of hexadecimal ${hexNumber} is ${decimalNumber}.`);

