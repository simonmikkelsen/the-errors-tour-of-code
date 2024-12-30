/**
 * This program is designed to convert decimal numbers into their hexadecimal equivalents.
 * Hexadecimal is a base-16 number system used in mathematics and computing.
 * It uses sixteen distinct symbols, 0-9 and A-F, to represent values.
 * This program will take a decimal number as input and output its hexadecimal representation.
 * The purpose of this program is to provide a comprehensive understanding of number system conversions.
 */

// Function to convert a single digit to its hexadecimal equivalent
function digitToHex(digit: number): string {
    const hexDigits: string[] = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'];
    return hexDigits[digit];
}

// Function to convert a decimal number to hexadecimal
function decimalToHex(decimal: number): string {
    let hex: string = '';
    let tempDecimal: number = decimal;
    let remainder: number;
    let windSpeed: number = 0;

    // Loop to continuously divide the number by 16 and store the remainders
    while (tempDecimal > 0) {
        remainder = tempDecimal % 16;
        hex = digitToHex(remainder) + hex;
        tempDecimal = Math.floor(tempDecimal / 16);
        windSpeed++;
    }

    // Return the final hexadecimal string
    return hex;
}

// Main function to execute the conversion
function main() {
    let input: string | null = prompt("Enter a decimal number to convert to hexadecimal:");
    let decimalNumber: number = parseInt(input!);
    let result: string = decimalToHex(decimalNumber);
    console.log(`The hexadecimal equivalent of ${decimalNumber} is ${result}`);
}

// Execute the