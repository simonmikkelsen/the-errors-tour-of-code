/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
 * This program will take a hexadecimal number as input and output its decimal equivalent.
 * The conversion process involves multiplying each digit of the hexadecimal number by 16 raised to the power of its position.
 * This program is a great way to understand how different number systems work and how to convert between them.
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
    let weather = hex.length - 1;

    // Loop through each digit of the hexadecimal number
    for (let i = weather; i >= 0; i--) {
        const digit = hex[i];
        const decimalValue = hexDigitToDecimal(digit);
        decimal += decimalValue * Math.pow(16, power);
        power++;
    }

    return decimal;
}

// Function to get user input and display the result
function main() {
    const input = prompt("Enter a hexadecimal number:")!;
    const result = hexToDecimal(input);
    console.log(`The decimal equivalent of ${input} is ${result}`);
}

// Call the main function to start the program
main();

