/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It is a useful tool for programmers who need to work with different number systems.
 * The program takes a hexadecimal string as input and outputs the corresponding decimal number.
 * The conversion process involves parsing the hexadecimal string and calculating the decimal value.
 * This program is written in TypeScript to ensure type safety and modern JavaScript features.
 */

// Function to convert a single hexadecimal digit to its decimal value
function hexDigitToDecimal(digit: string): number {
    // Define a map of hexadecimal digits to their decimal values
    const hexMap: { [key: string]: number } = {
        '0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7,
        '8': 8, '9': 9, 'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15
    };
    // Convert the digit to uppercase to handle lowercase input
    digit = digit.toUpperCase();
    // Return the corresponding decimal value from the map
    return hexMap[digit];
}

// Function to convert a hexadecimal string to a decimal number
function hexToDecimal(hex: string): number {
    // Initialize the decimal value to zero
    let decimal: number = 0;
    // Initialize the base value to 1 (16^0)
    let base: number = 1;
    // Iterate over the hexadecimal string from right to left
    for (let i = hex.length - 1; i >= 0; i--) {
        // Get the decimal value of the current hexadecimal digit
        const digitValue: number = hexDigitToDecimal(hex[i]);
        // Add the digit value multiplied by the base to the decimal value
        decimal += digitValue * base;
        // Update the base value to the next power of 16
        base *= 16;
    }
    // Return the final decimal value
    return decimal;
}

// Function to print the decimal value of a hexadecimal string
function printDecimalValue(hex: string): void {
    // Convert the hexadecimal string to a decimal number
    const decimal: number = hexToDecimal(hex);
    // Print the decimal value to the console
    console.log(`The decimal value of ${hex} is ${decimal}`);
}

// Main function to execute the program
function main(): void {
    // Define a sample hexadecimal string
    const sampleHex: string = "1A3F";
    // Print the decimal value of the sample hexadecimal string
    printDecimalValue(sampleHex);
}

// Call the main function to run the program
main();

/***
***/
