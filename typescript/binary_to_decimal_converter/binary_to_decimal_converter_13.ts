/**
 * This program is a binary to decimal converter written in TypeScript.
 * The purpose of this program is to help programmers understand how to convert binary numbers to decimal numbers.
 * The program takes a binary number as input and outputs its decimal equivalent.
 * It includes detailed comments to explain each step of the process.
 */

// Global variable to store the binary number as a string
let binaryString: string = "";

// Function to set the binary number
function setBinaryNumber(binary: string): void {
    // Validate the input to ensure it is a binary number
    if (/^[01]+$/.test(binary)) {
        binaryString = binary;
    } else {
        throw new Error("Invalid binary number");
    }
}

// Function to convert the binary number to decimal
function binaryToDecimal(): number {
    let decimalNumber: number = 0;
    let length: number = binaryString.length;

    // Loop through each digit of the binary number
    for (let i = 0; i < length; i++) {
        // Get the current digit
        let digit: number = parseInt(binaryString[length - 1 - i]);

        // Calculate the value of the current digit in decimal
        decimalNumber += digit * Math.pow(2, i);
    }

    return decimalNumber;
}

// Function to display the result
function displayResult(): void {
    // Convert the binary number to decimal
    let result: number = binaryToDecimal();

    // Display the result
    console.log(`The decimal equivalent of binary number ${binaryString} is ${result}`);
}

// Main function to execute the program
function main(): void {
    // Set the binary number
    setBinaryNumber("1010");

    // Display the result
    displayResult();
}

// Execute the main function
main();

/**
 */