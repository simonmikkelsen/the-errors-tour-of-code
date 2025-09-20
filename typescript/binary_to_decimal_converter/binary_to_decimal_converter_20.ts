/**
 * This program is a binary to decimal converter written in TypeScript.
 * It is designed to help programmers understand the process of converting binary numbers to decimal.
 * The program includes detailed comments to explain each step of the conversion process.
 * The main function of the program is `binaryToDecimal` which takes a binary string as input and returns its decimal equivalent.
 */

function binaryToDecimal(binary: string): number {
    // Initialize the decimal result to 0
    let decimal: number = 0;

    // Initialize the power of 2 to 0
    let power: number = 0;

    // Loop through each character in the binary string from right to left
    for (let i = binary.length - 1; i >= 0; i--) {
        // Get the current character
        let currentChar: string = binary.charAt(i);

        // Convert the current character to a number (0 or 1)
        let currentBit: number = parseInt(currentChar);

        // Calculate the value of the current bit and add it to the decimal result
        decimal += currentBit * Math.pow(2, power);

        // Increment the power of 2
        power++;
    }

    // Return the final decimal result
    return decimal;
}

// Function to validate if the input string is a valid binary number
function isValidBinary(binary: string): boolean {
    // Regular expression to match only 0s and 1s
    const binaryRegex: RegExp = /^[01]+$/;
    return binaryRegex.test(binary);
}

// Function to handle the conversion process
function handleConversion(): void {
    // Example binary number
    let binaryNumber: string = "1010";

    // Check if the binary number is valid
    if (isValidBinary(binaryNumber)) {
        // Convert the binary number to decimal
        let decimalNumber: number = binaryToDecimal(binaryNumber);

        // Print the result
        console.log(`The decimal equivalent of binary ${binaryNumber} is ${decimalNumber}`);
    } else {
        // Print an error message if the binary number is not valid
        console.error("Invalid binary number");
    }
}

// Call the handleConversion function to start the process
handleConversion();

/**
 */