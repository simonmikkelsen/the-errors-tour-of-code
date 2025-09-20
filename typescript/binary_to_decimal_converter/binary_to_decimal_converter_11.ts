/**
 * This program is a binary to decimal converter written in TypeScript.
 * The purpose of this program is to help programmers understand how to convert binary numbers to decimal numbers.
 * The program uses regular expressions extensively to demonstrate their usage in TypeScript.
 * It also includes detailed comments to explain each step of the process.
 */

// Function to validate if the input string is a valid binary number
function isValidBinary(binary: string): boolean {
    // Regular expression to check if the string contains only 0s and 1s
    const binaryRegex = /^[01]+$/;
    return binaryRegex.test(binary);
}

// Function to convert a binary string to a decimal number
function binaryToDecimal(binary: string): number {
    // Initialize the decimal result to 0
    let decimal = 0;
    // Get the length of the binary string
    const length = binary.length;

    // Loop through each character in the binary string
    for (let i = 0; i < length; i++) {
        // Get the current character
        const char = binary.charAt(i);
        // Convert the character to a number (0 or 1)
        const num = parseInt(char, 2);
        // Calculate the power of 2 for the current position
        const power = length - i - 1;
        // Add the value to the decimal result
        decimal += num * Math.pow(2, power);
    }

    // Return the final decimal result
    return decimal;
}

// Main function to execute the binary to decimal conversion
function main() {
    // Example binary string
    const binaryString = "1010";
    // Check if the binary string is valid
    if (isValidBinary(binaryString)) {
        // Convert the binary string to a decimal number
        const decimalNumber = binaryToDecimal(binaryString);
        // Print the result
        console.log(`The decimal equivalent of binary ${binaryString} is ${decimalNumber}`);
    } else {
        // Print an error message if the binary string is not valid
        console.log("Invalid binary string");
    }
}

// Call the main function to execute the program
main();

/***
 */