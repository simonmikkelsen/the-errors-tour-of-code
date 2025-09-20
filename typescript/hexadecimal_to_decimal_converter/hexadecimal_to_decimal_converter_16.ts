/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
 * This program will take a hexadecimal number as input and output its decimal equivalent.
 * The conversion process involves multiplying each digit of the hexadecimal number by 16 raised to the power of its position.
 * This program is intended to help programmers understand the conversion process and practice their TypeScript skills.
 */

// Function to convert a single hexadecimal digit to its decimal equivalent
function hexDigitToDecimal(digit: string): number {
    // Define a mapping of hexadecimal digits to their decimal values
    const hexMap: { [key: string]: number } = {
        '0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9,
        'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15
    };
    // Return the decimal value of the hexadecimal digit
    return hexMap[digit.toUpperCase()];
}

// Function to convert a hexadecimal number to its decimal equivalent
function hexToDecimal(hex: string): number {
    // Initialize the decimal result to 0
    let decimalResult = 0;
    // Initialize a variable to keep track of the current power of 16
    let power = 0;
    // Loop through each digit of the hexadecimal number, starting from the right
    for (let i = hex.length - 1; i >= 0; i--) {
        // Get the current digit
        let digit = hex[i];
        // Convert the digit to its decimal equivalent
        let decimalValue = hexDigitToDecimal(digit);
        // Add the decimal value to the result, multiplied by the current power of 16
        decimalResult += decimalValue * Math.pow(16, power);
        // Increment the power of 16
        power++;
    }
    // Return the final decimal result
    return decimalResult;
}

// Function to print the result
function printResult(hex: string): void {
    // Convert the hexadecimal number to its decimal equivalent
    let result = hexToDecimal(hex);
    // Print the result
    console.log(`The decimal equivalent of hexadecimal ${hex} is ${result}.`);
}

// Main function to run the program
function main(): void {
    // Define a sample hexadecimal number
    let sampleHex = "1A3F";
    // Print the result for the sample hexadecimal number
    printResult(sampleHex);
}

// Call the main function to run the program
main();

/**
 */