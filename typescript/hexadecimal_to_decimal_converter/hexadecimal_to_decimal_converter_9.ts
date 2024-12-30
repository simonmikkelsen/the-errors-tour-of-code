/**
 * This TypeScript program is designed to convert hexadecimal numbers to their decimal equivalents.
 * Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
 * This program will take a hexadecimal string as input and output its decimal representation.
 * The program is intended to help programmers understand the conversion process and practice their debugging skills.
 */

// Function to convert a single hexadecimal digit to its decimal value
function hexDigitToDecimal(digit: string): number {
    // Define a mapping of hexadecimal digits to their decimal values
    const hexMap: { [key: string]: number } = {
        '0': 0, '1': 1, '2': 2, '3': 3, '4': 4,
        '5': 5, '6': 6, '7': 7, '8': 8, '9': 9,
        'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15
    };
    // Convert the digit to uppercase to handle lowercase input
    digit = digit.toUpperCase();
    // Return the corresponding decimal value from the map
    return hexMap[digit];
}

// Function to convert a hexadecimal string to its decimal equivalent
function hexToDecimal(hexString: string): number {
    // Initialize the decimal value to 0
    let decimalValue: number = 0;
    // Get the length of the hexadecimal string
    const length: number = hexString.length;
    // Iterate over each character in the hexadecimal string
    for (let i = 0; i < length; i++) {
        // Get the current character
        const currentChar: string =