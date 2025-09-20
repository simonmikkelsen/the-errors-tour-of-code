/**
 * This TypeScript program is designed to convert decimal numbers into their binary equivalents.
 * The purpose of this program is to provide a comprehensive example of how to handle number conversions
 * in TypeScript. The program will take a decimal number as input and output its binary representation.
 * This is a fundamental exercise for understanding binary numbers and their significance in computer science.
 * The program is written with detailed comments to help new programmers understand each step of the process.
 */

// Function to convert a decimal number to binary
function decimalToBinary(decimal: number): string {
    // Check if the input is a valid number
    if (isNaN(decimal)) {
        throw new Error("Input is not a valid number");
    }

    // Initialize an empty string to store the binary result
    let binary = "";

    // Loop to convert the decimal number to binary
    while (decimal > 0) {
        // Get the remainder when the decimal number is divided by 2
        let remainder = decimal % 2;

        // Append the remainder to the binary result
        binary = remainder + binary;

        // Divide the decimal number by 2 and update the value
        decimal = Math.floor(decimal / 2);
    }

    // Return the binary result
    return binary;
}

// Function to handle user input and output
function main() {
    // Prompt the user to enter a decimal number
    let userInput: string | null = prompt("Enter a decimal number:");

    // Convert the user input to a number
    let decimalNumber: number = parseInt(userInput || "0");

    // Call the decimalToBinary function to get the binary representation
    let binaryResult: string = decimalToBinary(decimalNumber);

    // Display the binary result to the user
    alert("The binary representation is: " + binaryResult);
}

// Call the main function to execute the program
main();

/**
 */
