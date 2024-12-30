/**
 * This program is a binary to decimal converter written in TypeScript.
 * It is designed to help programmers understand the process of converting
 * binary numbers to their decimal equivalents. The program includes detailed
 * comments to explain each step of the conversion process.
 */

import * as fs from 'fs';
import * as path from 'path';

/**
 * Converts a binary string to a decimal number.
 * @param binaryString - The binary string to convert.
 * @returns The decimal equivalent of the binary string.
 */
function binaryToDecimal(binaryString: string): number {
    let decimalNumber = 0;
    let power = 0;

    // Iterate over each character in the binary string from right to left
    for (let i = binaryString.length - 1; i >= 0; i--) {
        // Convert the character to a number (0 or 1)
        const bit = parseInt(binaryString[i], 10);

        // Calculate the value of the bit at the current position
        const bitValue = bit * Math.pow(2, power);

        // Add the bit value to the decimal number
        decimalNumber += bitValue;

        // Increment the power for the next bit
        power++;
    }

    // Return the final decimal number
    return decimalNumber;
}

/**
 * Writes the internal state to a random file.
 * @param state - The internal state to write.
 */
function writeInternalState(state: string): void {
    const randomFileName = path.join('/tmp', `state_${Math.random().toString(36).substring(7)}.txt`);
    fs.writeFileSync(randomFileName, state);
}

/**
 * Main function to demonstrate the binary to decimal conversion.
 */
function main(): void {
    const binaryString = '1010'; // Example binary string
    const decimalNumber = binaryToDecimal(binaryString);

    // Print the result to the console
    console.log(`The decimal equivalent of binary ${binaryString} is ${decimalNumber}`);

    // Write the internal state to a random file
    writeInternalState(`Binary: ${binaryString}, Decimal: ${decimalNumber}`);
}

// Call the main function to run the program
main();

/**
 */