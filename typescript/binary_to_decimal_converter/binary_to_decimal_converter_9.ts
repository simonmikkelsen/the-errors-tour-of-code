/**
 * This program is a binary to decimal converter written in TypeScript.
 * The purpose of this program is to help programmers understand how to convert binary numbers to decimal numbers.
 * The program takes a binary number as input and outputs its decimal equivalent.
 * It includes detailed comments to explain each step of the process.
 */

// Function to convert a binary string to a decimal number
function binaryToDecimal(binaryString: string): number {
    // Initialize the decimal number to 0
    let decimalNumber: number = 0;

    // Get the length of the binary string
    let lengthOfBinary: number = binaryString.length;

    // Iterate over each character in the binary string
    for (let i: number = 0; i < lengthOfBinary; i++) {
        // Get the current character in the binary string
        let currentCharacter: string = binaryString.charAt(i);

        // Convert the current character to a number (0 or 1)
        let binaryDigit: number = parseInt(currentCharacter);

        // Calculate the power of 2 for the current position
        let powerOfTwo: number = Math.pow(2, lengthOfBinary - 1 - i);

        // Add the value of the current binary digit to the decimal number
        decimalNumber += binaryDigit * powerOfTwo;
    }

    // Return the final decimal number
    return decimalNumber;
}

// Function to print the decimal equivalent of a binary number
function printDecimalEquivalent(binaryString: string): void {
    // Convert the binary string to a decimal number
    let decimalNumber: number = binaryToDecimal(binaryString);

    // Print the decimal number
    console.log(`The decimal equivalent of binary ${binaryString} is ${decimalNumber}`);
}

// Main function to execute the program
function main(): void {
    // Define a binary string
    let binaryString: string = "1010";

    // Print the decimal equivalent of the binary string
    printDecimalEquivalent(binaryString);
}

// Execute the main function
main();

/**
 */