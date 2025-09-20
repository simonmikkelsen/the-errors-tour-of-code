/**
 * This TypeScript program is designed to convert hexadecimal numbers to their decimal equivalents.
 * Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
 * This program will take a hexadecimal string as input and output its decimal representation.
 * The program is intended to help programmers understand the conversion process and practice their TypeScript skills.
 */

// Function to convert a single hexadecimal digit to its decimal equivalent
function hexDigitToDecimal(hexDigit: string): number {
    // Define a mapping of hexadecimal digits to their decimal values
    const hexMap: { [key: string]: number } = {
        '0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9,
        'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15
    };

    // Convert the hexadecimal digit to uppercase to handle lowercase input
    const upperHexDigit = hexDigit.toUpperCase();

    // Return the corresponding decimal value from the hexMap
    return hexMap[upperHexDigit];
}

// Function to convert a hexadecimal string to its decimal equivalent
function hexToDecimal(hexString: string): number {
    // Initialize the decimal value to 0
    let decimalValue = 0;

    // Loop through each character in the hexadecimal string
    for (let i = 0; i < hexString.length; i++) {
        // Get the current hexadecimal digit
        const hexDigit = hexString[i];

        // Convert the hexadecimal digit to its decimal equivalent
        const decimalDigit = hexDigitToDecimal(hexDigit);

        // Update the decimal value by shifting the previous value to the left and adding the new digit
        decimalValue = decimalValue * 16 + decimalDigit;
    }

    // Return the final decimal value
    return decimalValue;
}

// Function to read a hexadecimal string from the user
function readHexString(): string {
    // Prompt the user to enter a hexadecimal string
    const userInput = prompt("Enter a hexadecimal number:");

    // Return the user's input
    return userInput || "";
}

// Main function to run the program
function main() {
    // Read the hexadecimal string from the user
    const hexString = readHexString();

    // Convert the hexadecimal string to its decimal equivalent
    const decimalValue = hexToDecimal(hexString);

    // Output the decimal value to the console
    console.log(`The decimal equivalent of ${hexString} is ${decimalValue}`);
}

// Call the main function to start the program
main();

/**
 */