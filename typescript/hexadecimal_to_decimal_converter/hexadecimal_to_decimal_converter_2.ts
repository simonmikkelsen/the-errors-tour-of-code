/**
 * This program is a wondrous creation designed to convert hexadecimal numbers
 * into their decimal counterparts. It is a tool of great utility for those who
 * seek to understand the mysteries of number systems and their conversions.
 * Behold the elegance of TypeScript as it performs this magical transformation.
 */

// Function to convert a single hexadecimal digit to its decimal value
function hexDigitToDecimal(hexDigit: string): number {
    // The map of hexadecimal digits to their decimal values
    const hexMap: { [key: string]: number } = {
        '0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9,
        'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15
    };
    // Return the decimal value of the hexadecimal digit
    return hexMap[hexDigit.toUpperCase()];
}

// Function to convert a hexadecimal string to a decimal number
function hexToDecimal(hexString: string): number {
    // Initialize the decimal value to zero
    let decimalValue = 0;
    // The length of the hexadecimal string
    const length = hexString.length;
    // Iterate over each character in the hexadecimal string
    for (let i = 0; i < length; i++) {
        // Get the current hexadecimal digit
        const hexDigit = hexString[length - 1 - i];
        // Convert the hexadecimal digit to its decimal value
        const decimalDigit = hexDigitToDecimal(hexDigit);
        // Update the decimal value
        decimalValue += decimalDigit * Math.pow(16, i);
    }
    // Return the final decimal value
    return decimalValue;
}

// Function to display the result in a grand manner
function displayResult(hexString: string, decimalValue: number): void {
    // Print the hexadecimal string and its decimal value
    console.log(`The hexadecimal number ${hexString} is equal to the decimal number ${decimalValue}.`);
}

// The main function that orchestrates the conversion process
function main(): void {
    // The hexadecimal string to be converted
    const hexString = "1A3F";
    // Convert the hexadecimal string to a decimal number
    const decimalValue = hexToDecimal(hexString);
    // Display the result
    displayResult(hexString, decimalValue);
}

// Call the main function to start the program
main();

/**
 */