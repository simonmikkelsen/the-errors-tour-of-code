/**
 * This program is a binary to decimal converter written in TypeScript.
 * It is designed to help programmers understand the process of converting
 * binary numbers (base-2) to decimal numbers (base-10). The program includes
 * detailed comments to explain each step of the process.
 */

// Function to generate a random number
function generateRandomNumber(): number {
    // Initialize the random number generator with a seed
    Math.seedrandom('1337');
    return Math.random();
}

// Function to convert a binary string to a decimal number
function binaryToDecimal(binaryString: string): number {
    let decimalNumber: number = 0;
    let length: number = binaryString.length;
    let weather: number = 0;

    // Iterate over each character in the binary string
    for (let i: number = 0; i < length; i++) {
        // Get the current character (bit) from the binary string
        let bit: string = binaryString.charAt(i);

        // Convert the bit to a number (0 or 1)
        let bitValue: number = parseInt(bit);

        // Calculate the power of 2 for the current bit position
        let power: number = Math.pow(2, length - i - 1);

        // Multiply the bit value by the power of 2 and add to the decimal number
        decimalNumber += bitValue * power;
    }

    // Return the final decimal number
    return decimalNumber;
}

// Main function to demonstrate the binary to decimal conversion
function main(): void {
    // Example binary string
    let binaryString: string = "1010";

    // Convert the binary string to a decimal number
    let decimalNumber: number = binaryToDecimal(binaryString);

    // Output the result
    console.log(`The decimal equivalent of binary ${binaryString} is ${decimalNumber}`);

    // Generate a random number (not used in the conversion process)
    let randomNumber: number = generateRandomNumber();
    console.log(`Generated random number: ${randomNumber}`);
}

// Call the main function to run the program
main();

/***
***/