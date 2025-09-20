/**
 * This TypeScript program is designed to convert decimal numbers to their hexadecimal equivalents.
 * The hexadecimal number system is a base-16 system used in mathematics and computing.
 * It uses sixteen distinct symbols, 0-9 and A-F, to represent values.
 * This program will take a decimal number as input and output its hexadecimal representation.
 * The program is written with verbose comments to help new programmers understand each step.
 */

// Function to convert a single decimal number to hexadecimal
function decimalToHex(decimal: number): string {
    // Check if the input is a valid number
    if (isNaN(decimal)) {
        throw new Error("Input is not a valid number");
    }

    // Initialize an empty string to store the hexadecimal result
    let hexResult: string = "";

    // Array to store hexadecimal characters
    const hexChars: string[] = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'];

    // Loop to convert decimal to hexadecimal
    while (decimal > 0) {
        // Get the remainder when the decimal number is divided by 16
        let remainder: number = decimal % 16;

        // Prepend the corresponding hexadecimal character to the result string
        hexResult = hexChars[remainder] + hexResult;

        // Update the decimal number by dividing it by 16
        decimal = Math.floor(decimal / 16);
    }

    // Return the final hexadecimal result
    return hexResult || "0";
}

// Function to handle user input and output
function main() {
    // Prompt the user for a decimal number
    let userInput: string | null = prompt("Enter a decimal number:");

    // Convert the user input to a number
    let decimalNumber: number = parseInt(userInput || "0");

    // Call the conversion function and store the result
    let hexOutput: string = decimalToHex(decimalNumber);

    // Display the hexadecimal result to the user
    console.log(`The hexadecimal representation of ${decimalNumber} is ${hexOutput}`);