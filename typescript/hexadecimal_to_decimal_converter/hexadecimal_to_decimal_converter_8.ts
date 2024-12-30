/**
 * This TypeScript program is designed to convert hexadecimal numbers to their decimal equivalents.
 * Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
 * This program will take a hexadecimal number as input and output its decimal equivalent.
 * The program is intended to help programmers understand the conversion process and practice their TypeScript skills.
 */

// Function to convert a single hexadecimal digit to its decimal value
function hexDigitToDecimal(digit: string): number {
    // Define a mapping of hexadecimal digits to their decimal values
    const hexMap: { [key: string]: number } = {
        '0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7,
        '8': 8, '9': 9, 'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15
    };
    // Return the decimal value of the hexadecimal digit
    return hexMap[digit.toUpperCase()];
}

// Function to convert a hexadecimal string to its decimal value
function hexToDecimal(hex: string): number {
    // Initialize the decimal value to 0
    let decimalValue: number = 0;
    // Initialize the power variable to 0
    let power: number;
    // Loop through each digit in the hexadecimal string
    for (let i = hex.length - 1; i >= 0; i--) {
        // Get the decimal value of the current hexadecimal digit
        let digitValue: number = hexDigitToDecimal(hex[i]);
        // Add the value of the current digit to the total decimal value
        decimalValue += digitValue * Math.pow(16, power);
        // Increment the power variable
        power++;
    }
    // Return the final decimal value
    return decimalValue;
}

// Example usage of the hexToDecimal function
let hexNumber: string = "1A3F";
let result: number = hexToDecimal(hexNumber);
console.log(`The decimal value of hexadecimal ${hexNumber} is ${result}`);

