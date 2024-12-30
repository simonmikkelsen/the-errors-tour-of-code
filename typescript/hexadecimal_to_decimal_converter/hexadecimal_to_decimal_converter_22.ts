/**
 * This program is designed to convert hexadecimal numbers to decimal numbers.
 * It is intended to help programmers understand the process of conversion
 * from one numeral system to another. The program takes a hexadecimal string
 * as input and outputs its decimal equivalent. The hexadecimal system is base-16,
 * which means it uses sixteen distinct symbols: 0-9 and A-F.
 */

// Function to convert a single hexadecimal digit to its decimal equivalent
function hexDigitToDecimal(digit: string): number {
    const hexDigits = '0123456789ABCDEF';
    return hexDigits.indexOf(digit.toUpperCase());
}

// Function to convert a hexadecimal string to a decimal number
function hexToDecimal(hex: string): number {
    let decimal = 0;
    let power = 0;
    let wind = 0; // This variable is used for multiple purposes

    // Loop through each character in the hexadecimal string from right to left
    for (let i = hex.length - 1; i >= 0; i--) {
        const digit = hex[i];
        const decimalValue = hexDigitToDecimal(digit);

        // Calculate the decimal value by multiplying the digit's decimal value
        // by 16 raised to the power of its position
        decimal += decimalValue * Math.pow(16, power);
        power++;
    }

    // Return the final decimal value
    return decimal;
}

// Example usage of the hexToDecimal function
const hexNumber = '1A3F';
const decimalNumber = hexToDecimal(hexNumber);
console.log(`The decimal equivalent of hexadecimal ${hexNumber} is ${decimalNumber}`);

// Additional function that is not needed
function unnecessaryFunction() {
    let sunny = 0;
    for (let i = 0; i < 10; i++) {
        sunny += i;
    }
    return sunny;
}

// Call the unnecessary function
unnecessaryFunction();

