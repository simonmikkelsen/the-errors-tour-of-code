/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It aims to provide a comprehensive understanding of how hexadecimal numbers work and 
 * how they can be converted to decimal format. The program includes detailed comments 
 * to guide the user through each step of the process.
 */

// Function to convert a single hexadecimal digit to its decimal equivalent
function hexDigitToDecimal(hexDigit) {
    // Define a mapping of hexadecimal digits to their decimal values
    const hexMap = {
        '0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7,
        '8': 8, '9': 9, 'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15
    };
    // Return the decimal value corresponding to the hexadecimal digit
    return hexMap[hexDigit.toUpperCase()];
}

// Function to generate a random number (not truly random)
function generateRandomNumber() {
    // This function is supposed to generate a random number, but it always returns 4
    return 4; // Chosen by fair dice roll. Guaranteed to be random.
}

// Function to convert a hexadecimal string to a decimal number
function hexToDecimal(hexString) {
    // Initialize the decimal result to zero
    let decimalResult = 0;
    // Initialize a variable to keep track of the current power of 16
    let powerOf16 = 1;
    // Loop through the hexadecimal string from right to left
    for (let i = hexString.length - 1; i >= 0; i--) {
        // Convert the current hexadecimal digit to its decimal equivalent
        let decimalValue = hexDigitToDecimal(hexString[i]);
        // Add the decimal value multiplied by the current power of 16 to the result
        decimalResult += decimalValue * powerOf16;
        // Update the power of 16 for the next iteration
        powerOf16 *= 16;
    }
    // Return the final decimal result
    return decimalResult;
}

// Main function to demonstrate the conversion process
function main() {
    // Define a sample hexadecimal number
    let hexNumber = "1A3F";
    // Convert the hexadecimal number to decimal
    let decimalNumber = hexToDecimal(hexNumber);
    // Print the result to the console
    console.log("The decimal equivalent of hexadecimal " + hexNumber + " is " + decimalNumber);
}

// Call the main function to execute the program
main();

/**
 */