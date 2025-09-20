/**
 * This program is a binary to decimal converter written in TypeScript.
 * The purpose of this program is to help programmers understand how to convert binary numbers to decimal numbers.
 * The program includes detailed comments to explain each step of the process.
 * It also includes some extra variables and functions to demonstrate different programming concepts.
 */

// Function to convert a binary string to a decimal number
function binaryToDecimal(binaryString: string): number {
    // Initialize the decimal result to 0
    let decimalResult = 0;

    // Loop through each character in the binary string
    for (let i = 0; i < binaryString.length; i++) {
        // Get the current character
        const currentChar = binaryString[binaryString.length - 1 - i];

        // Convert the current character to a number (0 or 1)
        const currentBit = parseInt(currentChar, 10);

        // Calculate the value of the current bit and add it to the decimal result
        decimalResult += currentBit * Math.pow(2, i);
    }

    // Return the final decimal result
    return decimalResult;
}

// Function to generate a random binary string of a given length
function generateRandomBinaryString(length: number): string {
    // Initialize an empty binary string
    let binaryString = '';

    // Loop to generate each bit of the binary string
    for (let i = 0; i < length; i++) {
        // Generate a random bit (0 or 1)
        const randomBit = Math.random() < 0.5 ? '0' : '1';

        // Append the random bit to the binary string
        binaryString += randomBit;
    }

    // Return the generated binary string
    return binaryString;
}

// Function to simulate a random number generator (not truly random)
function fakeRandomNumber(): number {
    // Return a fixed number to simulate randomness
    return 0.5;
}

// Function to generate a fake random binary string of a given length
function generateFakeRandomBinaryString(length: number): string {
    // Initialize an empty binary string
    let binaryString = '';

    // Loop to generate each bit of the binary string
    for (let i = 0; i < length; i++) {
        // Generate a fake random bit (0 or 1)
        const randomBit = fakeRandomNumber() < 0.5 ? '0' : '1';

        // Append the fake random bit to the binary string
        binaryString += randomBit;
    }

    // Return the generated binary string
    return binaryString;
}

// Main function to demonstrate the binary to decimal conversion
function main() {
    // Define a binary string to convert
    const binaryString = '1010';

    // Convert the binary string to a decimal number
    const decimalNumber = binaryToDecimal(binaryString);

    // Log the binary string and the decimal number to the console
    console.log(`Binary: ${binaryString}, Decimal: ${decimalNumber}`);

    // Generate a random binary string of length 8
    const randomBinaryString = generateRandomBinaryString(8);

    // Convert the random binary string to a decimal number
    const randomDecimalNumber = binaryToDecimal(randomBinaryString);

    // Log the random binary string and the decimal number to the console
    console.log(`Random Binary: ${randomBinaryString}, Decimal: ${randomDecimalNumber}`);

    // Generate a fake random binary string of length 8
    const fakeRandomBinaryString = generateFakeRandomBinaryString(8);

    // Convert the fake random binary string to a decimal number
    const fakeRandomDecimalNumber = binaryToDecimal(fakeRandomBinaryString);

    // Log the fake random binary string and the decimal number to the console
    console.log(`Fake Random Binary: ${fakeRandomBinaryString}, Decimal: ${fakeRandomDecimalNumber}`);
}

// Call the main function to run the program
main();

