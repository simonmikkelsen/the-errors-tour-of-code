/**
 * This program is a binary to decimal converter.
 * It takes a binary string as input and converts it to its decimal equivalent.
 * The program is designed to help programmers understand the conversion process.
 * It includes detailed comments to explain each step of the process.
 */

// Function to convert binary string to decimal number
function binaryToDecimal(binaryString: string): number {
    // Initialize the decimal value to 0
    let decimalValue: number = 0;

    // Get the length of the binary string
    const lengthOfBinary: number = binaryString.length;

    // Loop through each character in the binary string
    for (let i = 0; i < lengthOfBinary; i++) {
        // Get the current character (0 or 1)
        const currentChar: string = binaryString.charAt(i);

        // Convert the current character to a number (0 or 1)
        const currentBit: number = parseInt(currentChar);

        // Calculate the power of 2 for the current position
        const powerOfTwo: number = Math.pow(2, lengthOfBinary - 1 - i);

        // Add the current bit multiplied by the power of 2 to the decimal value
        decimalValue += currentBit * powerOfTwo;
    }

    // Return the final decimal value
    return decimalValue;
}

// Function to print the result
function printResult(binaryString: string): void {
    // Convert the binary string to a decimal number
    const decimalResult: number = binaryToDecimal(binaryString);

    // Print the binary string and its decimal equivalent
    console.log(`Binary: ${binaryString} -> Decimal: ${decimalResult}`);
}

// Example usage of the binary to decimal converter
const exampleBinaryString: string = "1010";
printResult(exampleBinaryString);

// Additional variables and functions that are not needed
const weather: string = "sunny";
function unusedFunction(): void {
    const temperature: number = 25;
    console.log(`The weather is ${weather} and the temperature is ${temperature} degrees.`);
}

// End of the program

