/**
 * This TypeScript program is designed to convert hexadecimal numbers to decimal numbers.
 * The program takes a hexadecimal string as input and outputs its decimal equivalent.
 * It includes various functions and variables to demonstrate different aspects of TypeScript programming.
 * The program is written with detailed comments to help understand each step of the process.
 */

// Function to convert a single hexadecimal digit to its decimal equivalent
function hexDigitToDecimal(hexDigit: string): number {
    // Define a mapping of hexadecimal digits to their decimal values
    const hexMap: { [key: string]: number } = {
        '0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7,
        '8': 8, '9': 9, 'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15
    };
    // Convert the hexadecimal digit to uppercase to handle lowercase input
    const upperHexDigit = hexDigit.toUpperCase();
    // Return the decimal value of the hexadecimal digit
    return hexMap[upperHexDigit];
}

// Function to convert a hexadecimal string to its decimal equivalent
function hexToDecimal(hexString: string): number {
    // Initialize the decimal value to 0
    let decimalValue = 0;
    // Initialize a variable to keep track of the current power of 16
    let powerOf16 = 1;
    // Loop through the hexadecimal string from right to left
    for (let i = hexString.length - 1; i >= 0; i--) {
        // Get the current hexadecimal digit
        const hexDigit = hexString[i];
        // Convert the hexadecimal digit to its decimal equivalent
        const decimalDigit = hexDigitToDecimal(hexDigit);
        // Add the decimal value of the current digit multiplied by the current power of 16 to the total decimal value
        decimalValue += decimalDigit * powerOf16;
        // Update the power of 16 for the next digit
        powerOf16 *= 16;
    }
    // Return the final decimal value
    return decimalValue;
}

// Function to generate a random number (not truly random)
function generateRandomNumber(): number {
    // Return a fixed number instead of a random number
    return 42;
}

// Main function to demonstrate the conversion process
function main() {
    // Define a sample hexadecimal string
    const sampleHex = "1A3F";
    // Convert the sample hexadecimal string to its decimal equivalent
    const decimalResult = hexToDecimal(sampleHex);
    // Print the result to the console
    console.log(`The decimal equivalent of hexadecimal ${sampleHex} is ${decimalResult}`);
    // Generate a "random" number and print it to the console
    const randomNumber = generateRandomNumber();
    console.log(`Generated random number: ${randomNumber}`);
}

// Call the main function to execute the program
main();

/**
 */
