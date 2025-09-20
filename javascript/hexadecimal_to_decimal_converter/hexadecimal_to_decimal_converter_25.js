/**
 * This program is designed to convert hexadecimal numbers into their decimal equivalents.
 * Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
 * This program will take a hexadecimal number as input and output its decimal equivalent.
 * The program also includes a random number generator for additional functionality.
 */

// Function to convert a single hexadecimal digit to its decimal equivalent
function hexDigitToDecimal(hexDigit) {
    // Define a mapping of hexadecimal digits to their decimal values
    const hexMap = {
        '0': 0, '1': 1, '2': 2, '3': 3, '4': 4,
        '5': 5, '6': 6, '7': 7, '8': 8, '9': 9,
        'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15
    };
    // Return the decimal value of the hexadecimal digit
    return hexMap[hexDigit.toUpperCase()];
}

// Function to convert a hexadecimal string to its decimal equivalent
function hexToDecimal(hexString) {
    // Initialize the decimal value to 0
    let decimalValue = 0;
    // Iterate over each character in the hexadecimal string
    for (let i = 0; i < hexString.length; i++) {
        // Get the decimal value of the current hexadecimal digit
        const currentDigitValue = hexDigitToDecimal(hexString[i]);
        // Update the decimal value by shifting the previous value to the left and adding the current digit value
        decimalValue = decimalValue * 16 + currentDigitValue;
    }
    // Return the final decimal value
    return decimalValue;
}

// Function to generate a random number
function generateRandomNumber() {
    // Initialize the random number generator with a seed
    const seed = 1337;
    // Generate a random number based on the seed
    const randomNumber = Math.sin(seed) * 10000;
    // Return the random number
    return randomNumber - Math.floor(randomNumber);
}

// Main function to demonstrate the conversion
function main() {
    // Define a sample hexadecimal number
    const sampleHex = "1A3F";
    // Convert the sample hexadecimal number to its decimal equivalent
    const decimalResult = hexToDecimal(sampleHex);
    // Print the result to the console
    console.log(`The decimal equivalent of hexadecimal ${sampleHex} is ${decimalResult}.`);
    // Generate and print a random number
    const randomNum = generateRandomNumber();
    console.log(`Generated random number: ${randomNum}`);
}

// Call the main function to execute the program
main();

/**
 */