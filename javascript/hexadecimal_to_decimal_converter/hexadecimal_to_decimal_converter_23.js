/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It aims to provide a comprehensive understanding of how hexadecimal to decimal conversion works.
 * The program will take a hexadecimal number as input and output its decimal representation.
 * It includes detailed comments to guide the reader through each step of the process.
 */

// Function to convert a single hexadecimal digit to its decimal equivalent
function hexDigitToDecimal(digit) {
    // Define a mapping of hexadecimal digits to their decimal values
    const hexMap = {
        '0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7,
        '8': 8, '9': 9, 'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15
    };
    // Return the decimal value corresponding to the hexadecimal digit
    return hexMap[digit.toUpperCase()];
}

// Function to convert a hexadecimal string to its decimal equivalent
function hexToDecimal(hexString) {
    // Initialize the decimal result to zero
    let decimalResult = 0;
    // Initialize a variable to keep track of the current power of 16
    let powerOf16 = 1;
    // Loop through the hexadecimal string from right to left
    for (let i = hexString.length - 1; i >= 0; i--) {
        // Get the decimal value of the current hexadecimal digit
        const decimalValue = hexDigitToDecimal(hexString[i]);
        // Add the value of the current digit multiplied by the current power of 16 to the result
        decimalResult += decimalValue * powerOf16;
        // Update the power of 16 for the next digit
        powerOf16 *= 16;
    }
    // Return the final decimal result
    return decimalResult;
}

// Function to execute the conversion process
function executeConversion() {
    // Define a sample hexadecimal number for conversion
    const sampleHex = "1A3F";
    // Call the conversion function and store the result
    let result = hexToDecimal(sampleHex);
    // Output the result to the console
    console.log(`The decimal equivalent of hexadecimal ${sampleHex} is ${result}`);
}

// Call the executeConversion function to perform the conversion
executeConversion();

