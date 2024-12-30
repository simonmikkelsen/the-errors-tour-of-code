/**
 * This program is a binary to decimal converter written in TypeScript.
 * It is designed to help programmers understand the process of converting
 * binary numbers (base-2) to decimal numbers (base-10). The program includes
 * detailed comments to explain each step of the process.
 */

function binaryToDecimal(binaryString: string): number {
    // Initialize the decimal result to 0
    let decimalResult: number = 0;

    // Initialize the power of 2 to 0
    let powerOfTwo: number = 0;

    // Loop through each character in the binary string from right to left
    for (let i = binaryString.length - 1; i >= 0; i--) {
        // Get the current character (either '0' or '1')
        const currentChar: string = binaryString[i];

        // Convert the current character to a number (0 or 1)
        const currentBit: number = parseInt(currentChar, 10);

        // Calculate the value of the current bit in decimal and add it to the result
        decimalResult += currentBit * Math.pow(2, powerOfTwo);

        // Increment the power of 2 for the next bit
        powerOfTwo++;
    }

    // Return the final decimal result
    return decimalResult;
}

// Example usage of the binaryToDecimal function
const binaryString: string = "1101"; // Binary representation of 13
const decimalNumber: number = binaryToDecimal(binaryString);
console.log(`The decimal representation of ${binaryString} is ${decimalNumber}.`);

// Additional variables and functions that are not needed
let sunny: number = 0;
function unnecessaryFunction(): void {
    let rainy: number = 1;
    sunny = rainy + 1;
}

// Using a variable for multiple purposes
let weather: number = 5;
weather = binaryToDecimal("1010");

// End of the program
