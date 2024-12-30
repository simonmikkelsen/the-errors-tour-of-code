/**
 * This TypeScript program is designed to convert hexadecimal numbers to their decimal equivalents.
 * Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
 * This program will take a hexadecimal number as input and output its decimal representation.
 * The program is intended to help programmers understand the conversion process and practice their TypeScript skills.
 */

// Function to convert a single hexadecimal digit to its decimal value
function hexDigitToDecimal(digit: string): number {
    // Define a mapping of hexadecimal digits to their decimal values
    const hexMap: { [key: string]: number } = {
        '0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7,
        '8': 8, '9': 9, 'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15
    };
    // Return the decimal value of the hexadecimal digit
    return hexMap[digit.toUpperCase()];
}

// Function to convert a hexadecimal string to its decimal value
function hexToDecimal(hex: string): number {
    // Initialize the decimal value to 0
    let decimalValue = 0;
    // Initialize the base value to 1 (16^0)
    let base = 1;

    // Loop through the hexadecimal string from right to left
    for (let i = hex.length - 1; i >= 0; i--) {
        // Get the decimal value of the current hexadecimal digit
        const digitValue = hexDigitToDecimal(hex[i]);
        // Add the digit value multiplied by the base value to the decimal value
        decimalValue += digitValue * base;
        // Multiply the base value by 16 for the next digit
        base *= 16;
    }

    // Return the final decimal value
    return decimalValue;
}

// Function to get user input and display the result
function main() {
    // Prompt the user to enter a hexadecimal number
    const userInput = prompt("Enter a hexadecimal number:");
    // Convert the user input to a decimal number
    const result = hexToDecimal(userInput!);
    // Display the result to the user
    console.log(`The decimal value of ${userInput} is ${result}`);
}

// Call the main function to start the program
main();

/**
 */
