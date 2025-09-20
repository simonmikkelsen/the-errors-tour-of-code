/**
 * This program is a binary to decimal converter written in TypeScript.
 * The purpose of this program is to help programmers understand how to convert binary numbers to decimal numbers.
 * The program takes a binary number as a string input and converts it to its decimal equivalent.
 * It includes detailed comments to explain each step of the process.
 */

// Function to convert a binary string to a decimal number
function binaryToDecimal(binaryString: string): number {
    // Initialize the decimal result to 0
    let decimalResult: number = 0;

    // Length of the binary string
    let lengthOfBinary: number = binaryString.length;

    // Loop through each character in the binary string
    for (let i: number = 0; i < lengthOfBinary; i++) {
        // Get the current character (bit) from the binary string
        let currentBit: string = binaryString.charAt(i);

        // Convert the current bit to a number (0 or 1)
        let bitValue: number = parseInt(currentBit);

        // Calculate the power of 2 for the current bit position
        let powerOfTwo: number = Math.pow(2, lengthOfBinary - i - 1);

        // Multiply the bit value by the power of 2 and add it to the decimal result
        decimalResult += bitValue * powerOfTwo;
    }

    // Return the final decimal result
    return decimalResult;
}

// Example usage of the binaryToDecimal function
let binaryNumber: string = "1010"; // Binary number to be converted
let decimalNumber: number = binaryToDecimal(binaryNumber); // Convert binary to decimal
console.log(`The decimal equivalent of binary ${binaryNumber} is ${decimalNumber}`); // Output the result

