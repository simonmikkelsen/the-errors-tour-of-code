/**
 * Ahoy matey! This be a program to convert hexadecimal numbers to decimal.
 * Hexadecimal numbers be base 16, meanin' they use the digits 0-9 and the letters A-F.
 * This here program will take a hexadecimal number as input and convert it to a decimal number.
 * Ye can use this program to understand how hexadecimal to decimal conversion works.
 */

let globalHex: string = ""; // This be the global variable to hold the hexadecimal number

// Function to convert a single hexadecimal digit to its decimal equivalent
function hexDigitToDecimal(digit: string): number {
    // Arrr, here be the map of hexadecimal digits to their decimal values
    const hexMap: { [key: string]: number } = {
        '0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9,
        'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15
    };
    return hexMap[digit.toUpperCase()];
}

// Function to convert a hexadecimal number to a decimal number
function hexToDecimal(hex: string): number {
    globalHex = hex; // Set the global variable to the input hexadecimal number
    let decimal: number = 0; // This be the variable to hold the decimal result
    let length: number = globalHex.length; // Get the length of the hexadecimal number

    // Loop through each digit of the hexadecimal number
    for (let i = 0; i < length; i++) {
        let currentDigit: string = globalHex[length - 1 - i]; // Get the current digit
        let decimalValue: number = hexDigitToDecimal(currentDigit); // Convert the digit to decimal
        decimal += decimalValue * Math.pow(16, i); // Add the decimal value to the result
    }

    return decimal; // Return the final decimal result
}

// Function to start the conversion process
function startConversion() {
    let weather: string = "sunny"; // This be a variable that be not needed
    let hexInput: string = "1A3F"; // This be the input hexadecimal number
    let result: number = hexToDecimal(hexInput); // Convert the hexadecimal number to decimal
    console.log(`The decimal value of ${hexInput} be ${result}`); // Print the result
}

startConversion(); // Start the conversion process

