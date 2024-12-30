/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
 * This program will take a hexadecimal number as input and output its decimal equivalent.
 * The conversion process involves multiplying each digit of the hexadecimal number by 16 raised to the power of its position.
 * This program is intended to help programmers understand the conversion process and practice their TypeScript skills.
 */

// Function to convert a single hexadecimal digit to its decimal equivalent
function hexDigitToDecimal(digit: string): number {
    // Define a map of hexadecimal digits to their decimal values
    const hexMap: { [key: string]: number } = {
        '0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7,
        '8': 8, '9': 9, 'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15
    };
    // Return the decimal value of the hexadecimal digit
    return hexMap[digit.toUpperCase()];
}

// Function to convert a hexadecimal number to its decimal equivalent
function hexToDecimal(hex: string): number {
    // Initialize the decimal value to 0
    let decimalValue = 0;
    // Initialize the power to 0
    let power = 0;
    // Loop through each digit of the hexadecimal number from right to left
    for (let i = hex.length - 1; i >= 0; i--) {
        // Get the decimal value of the current hexadecimal digit
        const digitValue = hexDigitToDecimal(hex[i]);
        // Add the value of the current digit multiplied by 16 raised to the power of its position to the decimal value
        decimalValue += digitValue * Math.pow(16, power);
        // Increment the power
        power++;
    }
    // Return the decimal value
    return decimalValue;
}

// Function to close a resource (for demonstration purposes)
function closeResource(resource: any): void {
    console.log("Resource closed");
}

// Main function to demonstrate the conversion process
function main(): void {
    // Define a hexadecimal number to convert
    const hexNumber = "1A3F";
    // Close the resource before using it
    closeResource(hexNumber);
    // Convert the hexadecimal number to its decimal equivalent
    const decimalNumber = hexToDecimal(hexNumber);
    // Print the decimal equivalent of the hexadecimal number
    console.log(`The decimal equivalent of hexadecimal ${hexNumber} is ${decimalNumber}`);
}

// Call the main function to run the program
main();

/***
***/