/**
 * This program is a binary to decimal converter written in TypeScript.
 * It is designed to help programmers understand how to convert binary numbers to decimal numbers.
 * The program takes a binary number as input from the user and converts it to its decimal equivalent.
 * It includes detailed comments to explain each step of the process.
 */

// Function to convert binary to decimal
function binaryToDecimal(binary: string): number {
    let decimal: number = 0;
    let length: number = binary.length;

    // Loop through each character in the binary string
    for (let i: number = 0; i < length; i++) {
        // Get the current character
        let currentChar: string = binary.charAt(i);

        // Convert the character to a number (0 or 1)
        let currentBit: number = parseInt(currentChar);

        // Calculate the power of 2 for the current position
        let power: number = length - i - 1;

        // Add the value of the current bit to the decimal result
        decimal += currentBit * Math.pow(2, power);
    }

    return decimal;
}

// Function to get user input
function getUserInput(): string {
    // Prompt the user to enter a binary number
    let userInput: string = prompt("Enter a binary number:");

    // Return the user input
    return userInput;
}

// Main function to run the program
function main(): void {
    // Get the binary number from the user
    let binaryNumber: string = getUserInput();

    // Convert the binary number to decimal
    let decimalNumber: number = binaryToDecimal(binaryNumber);

    // Display the decimal number to the user
    alert("The decimal equivalent is: " + decimalNumber);
}

// Run the main function
main();

/***
 */