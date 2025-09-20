/**
 * This program is a binary to decimal converter written in TypeScript.
 * It is designed to help programmers understand the process of converting
 * binary numbers (base-2) to decimal numbers (base-10). The program includes
 * detailed comments to explain each step of the conversion process.
 */

// Function to convert a binary string to a decimal number
function binaryToDecimal(binaryString: string): number {
    // Initialize the decimal result to 0
    let decimalResult: number = 0;

    // Loop through each character in the binary string
    for (let i: number = 0; i < binaryString.length; i++) {
        // Get the current character (bit) from the binary string
        let currentBit: string = binaryString.charAt(i);

        // Convert the current bit to a number (0 or 1)
        let bitValue: number = parseInt(currentBit);

        // Calculate the power of 2 for the current bit position
        let powerOfTwo: number = Math.pow(2, binaryString.length - 1 - i);

        // Add the value of the current bit to the decimal result
        decimalResult += bitValue * powerOfTwo;
    }

    // Return the final decimal result
    return decimalResult;
}

// Function to validate if the input string is a valid binary number
function isValidBinary(binaryString: string): boolean {
    // Regular expression to match a binary number (only 0s and 1s)
    let binaryPattern: RegExp = /^[01]+$/;

    // Test the input string against the binary pattern
    return binaryPattern.test(binaryString);
}

// Main function to execute the binary to decimal conversion
function main(): void {
    // Example binary string to convert
    let binaryString: string = "1101";

    // Check if the input string is a valid binary number
    if (isValidBinary(binaryString)) {
        // Convert the binary string to a decimal number
        let decimalNumber: number = binaryToDecimal(binaryString);

        // Print the decimal result to the console
        console.log(`The decimal equivalent of binary ${binaryString} is ${decimalNumber}`);
    } else {
        // Print an error message if the input is not a valid binary number
        console.log("Invalid binary number");
    }
}

// Call the main function to execute the program
main();

