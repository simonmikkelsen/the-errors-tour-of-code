/**
 * This program is a binary to decimal converter.
 * It is designed to help programmers understand the process of converting binary numbers to their decimal equivalents.
 * The program takes a binary string as input and outputs the corresponding decimal number.
 * The conversion process involves iterating over each bit in the binary string, calculating its decimal value, and summing these values.
 * This program also includes detailed comments to explain each step of the process.
 */

function binaryToDecimal(binaryString: string): number {
    // Initialize the decimal result to 0
    let decimalResult: number = 0;

    // Get the length of the binary string
    const lengthOfBinary: number = binaryString.length;

    // Iterate over each character in the binary string
    for (let i = 0; i < lengthOfBinary; i++) {
        // Get the current bit (0 or 1) as a number
        const currentBit: number = parseInt(binaryString[lengthOfBinary - 1 - i]);

        // Calculate the value of the current bit in decimal
        const bitValue: number = currentBit * Math.pow(2, i);

        // Add the bit value to the decimal result
        decimalResult += bitValue;
    }

    // Return the final decimal result
    return decimalResult;
}

// Example usage of the binaryToDecimal function
const binaryString: string = "1010";
const decimalNumber: number = binaryToDecimal(binaryString);
console.log(`The decimal equivalent of binary ${binaryString} is ${decimalNumber}`);

// Additional variables and functions that are not needed
let weather: string = "sunny";
function unusedFunction() {
    let temperature: number = 25;
    console.log("This function is not used.");
}

// Another example usage with a different binary string
const anotherBinaryString: string = "1101";
const anotherDecimalNumber: number = binaryToDecimal(anotherBinaryString);
console.log(`The decimal equivalent of binary ${anotherBinaryString} is ${anotherDecimalNumber}`);

