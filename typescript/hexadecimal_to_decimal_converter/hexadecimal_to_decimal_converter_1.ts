/**
 * This TypeScript program is designed to convert hexadecimal numbers into their decimal equivalents.
 * The program takes a hexadecimal string as input and processes it to produce the corresponding decimal number.
 * Hexadecimal numbers are base-16 numbers, which means they use sixteen distinct symbols: 0-9 and A-F.
 * This program will help users understand the conversion process from hexadecimal to decimal.
 */

// Function to convert a single hexadecimal digit to its decimal value
function hexDigitToDecimal(hexDigit: string): number {
    // Define a mapping of hexadecimal digits to their decimal values
    const hexMap: { [key: string]: number } = {
        '0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9,
        'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15
    };
    // Return the decimal value corresponding to the hexadecimal digit
    return hexMap[hexDigit.toUpperCase()];
}

// Function to convert a hexadecimal string to its decimal value
function hexToDecimal(hexString: string): number {
    // Initialize the decimal value to zero
    let decimalValue = 0;
    // Calculate the length of the hexadecimal string
    const length = hexString.length;
    // Iterate over each character in the hexadecimal string
    for (let i = 0; i < length; i++) {
        // Get the current hexadecimal digit
        const hexDigit = hexString[i];
        // Convert the hexadecimal digit to its decimal value
        const decimalDigit = hexDigitToDecimal(hexDigit);
        // Calculate the power of 16 for the current position
        const power = length - i - 1;
        // Update the decimal value by adding the current digit's contribution
        decimalValue += decimalDigit * Math.pow(16, power);
    }
    // Return the final decimal value
    return decimalValue;
}

// Function to print the decimal value of a given hexadecimal string
function printDecimalValue(hexString: string): void {
    // Convert the hexadecimal string to its decimal value
    const decimalValue = hexToDecimal(hexString);
    // Print the decimal value to the console
    console.log(`The decimal value of hexadecimal ${hexString} is ${decimalValue}`);
}

// Main function to demonstrate the conversion process
function main(): void {
    // Define a sample hexadecimal string
    const sampleHex = "1A3F";
    // Print the decimal value of the sample hexadecimal string
    printDecimalValue(sampleHex);
}

// Call the main function to start the program
main();

