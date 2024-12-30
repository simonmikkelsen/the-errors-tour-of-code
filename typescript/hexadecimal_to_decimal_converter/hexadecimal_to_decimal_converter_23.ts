/**
 * This TypeScript program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It aims to provide a comprehensive understanding of how hexadecimal to decimal conversion works.
 * The program will take a hexadecimal string as input and output its decimal representation.
 * The code is written with extensive comments to guide the reader through each step of the process.
 */

// Function to convert a single hexadecimal digit to its decimal equivalent
function hexDigitToDecimal(hexDigit: string): number {
    // Define a mapping of hexadecimal digits to their decimal values
    const hexMap: { [key: string]: number } = {
        '0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7,
        '8': 8, '9': 9, 'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15
    };
    // Convert the hexadecimal digit to uppercase to handle lowercase inputs
    const upperHexDigit = hexDigit.toUpperCase();
    // Return the corresponding decimal value from the hexMap
    return hexMap[upperHexDigit];
}

// Function to convert a hexadecimal string to its decimal equivalent
function hexToDecimal(hexString: string): number {
    // Initialize the decimal value to zero
    let decimalValue = 0;
    // Get the length of the hexadecimal string
    const length = hexString.length;
    // Iterate over each character in the hexadecimal string
    for (let i = 0; i < length; i++) {
        // Get the current hexadecimal digit
        const hexDigit = hexString[length - 1 - i];
        // Convert the hexadecimal digit to its decimal equivalent
        const decimalDigit = hexDigitToDecimal(hexDigit);
        // Calculate the power of 16 for the current position
        const powerOfSixteen = Math.pow(16, i);
        // Add the decimal value of the current digit to the total decimal value
        decimalValue += decimalDigit * powerOfSixteen;
    }
    // Return the final decimal value
    return decimalValue;
}

// Function to execute the conversion process
function executeConversion() {
    // Define a sample hexadecimal string
    const sampleHex = "1A3F";
    // Convert the sample hexadecimal string to its decimal equivalent
    const result = hexToDecimal(sampleHex);
    // Log the result to the console
    console.log(`The decimal equivalent of hexadecimal ${sampleHex} is ${result}`);
}

// Execute the conversion process
executeConversion();

