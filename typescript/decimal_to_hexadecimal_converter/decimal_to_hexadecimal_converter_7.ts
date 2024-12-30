/**
 * This TypeScript program is designed to convert decimal numbers to their hexadecimal equivalents.
 * The program takes a decimal number as input and outputs the corresponding hexadecimal representation.
 * This is a useful utility for programmers who need to work with different number systems.
 * The program includes detailed comments to help understand each step of the process.
 */

// Function to convert a single digit to its hexadecimal equivalent
function digitToHex(digit: number): string {
    const hexDigits = "0123456789ABCDEF";
    return hexDigits[digit];
}

// Function to convert a decimal number to its hexadecimal representation
function decimalToHex(decimal: number): string {
    // Initialize an empty string to store the hexadecimal result
    let hexResult = "";

    // Loop until the entire decimal number has been converted
    while (decimal > 0) {
        // Calculate the remainder when the decimal number is divided by 16
        let remainder = decimal % 16;

        // Convert the remainder to its hexadecimal equivalent and prepend it to the result string
        hexResult = digitToHex(remainder) + hexResult;

        // Update the decimal number by dividing it by 16
        decimal = Math.floor(decimal / 16);
    }

    // Return the final hexadecimal result
    return hexResult;
}

// Function to handle user input and output
function main() {
    // Prompt the user to enter a decimal number
    let userInput: string | null = prompt("Enter a decimal number to convert to hexadecimal:");

    // Check if the user provided input
    if (userInput !== null) {
        // Convert the user input to a number
        let decimalNumber = parseInt(userInput);

        // Check if the input is a valid number
        if (!isNaN(decimalNumber)) {
            // Call the conversion function and store the