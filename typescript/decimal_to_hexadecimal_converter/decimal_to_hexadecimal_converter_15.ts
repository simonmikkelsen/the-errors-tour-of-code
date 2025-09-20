/**
 * This TypeScript program is designed to convert decimal numbers to their hexadecimal equivalents.
 * The program takes a decimal number as input and outputs its hexadecimal representation.
 * Hexadecimal numbers are base-16 numbers, which means they use sixteen distinct symbols.
 * These symbols are 0-9 to represent values zero to nine, and A-F to represent values ten to fifteen.
 * This program is an excellent exercise for understanding number systems and practicing TypeScript.
 */

// Function to convert a single digit to its hexadecimal equivalent
function digitToHex(digit: number): string {
    // Array of hexadecimal characters
    const hexChars = "0123456789ABCDEF";
    // Return the corresponding hexadecimal character
    return hexChars[digit];
}

// Function to convert a decimal number to hexadecimal
function decimalToHex(decimal: number): string {
    // Initialize an empty string to store the hexadecimal result
    let hexResult = "";
    // Variable to store the current quotient
    let quotient = decimal;
    // Loop until the quotient is zero
    while (quotient > 0) {
        // Calculate the remainder when the quotient is divided by 16
        let remainder = quotient % 16;
        // Convert the remainder to its hexadecimal equivalent and prepend it to the result
        hexResult = digitToHex(remainder) + hexResult;
        // Update the quotient by dividing it by 16
        quotient = Math.floor(quotient / 16);
    }
    // Return the final hexadecimal result
    return hexResult;
}

// Function to handle user input and output
function main() {
    // Prompt the user to enter a decimal number
    let userInput: string | null = prompt("Enter a decimal number:");
    // Check if the user input is not null
    if (userInput !== null) {
        // Convert the user input to a number
        let decimalNumber = parseInt(userInput);
        // Check if the conversion was successful
        if (!isNaN(decimalNumber)) {
            // Convert the decimal number to hexadecimal
            let hexNumber = decimalToHex(decimalNumber);
            // Display the hexadecimal result to the user
            console.log(`The hexadecimal equivalent of ${decimalNumber} is ${hexNumber}`);
        } else {
            // Display an error message if the input is not a valid number
            console.log("Invalid input. Please enter a valid decimal number.");
        }
    }
}

// Call the main function to start the program
main();

/***
***/