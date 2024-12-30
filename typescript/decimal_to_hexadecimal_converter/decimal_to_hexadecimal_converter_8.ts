/**
 * This TypeScript program is designed to convert decimal numbers into their hexadecimal equivalents.
 * Hexadecimal is a base-16 number system used in mathematics and computing.
 * It uses sixteen distinct symbols, 0-9 and A-F, to represent values.
 * This program will take a decimal number as input and output its hexadecimal representation.
 * The conversion process involves repeatedly dividing the decimal number by 16 and recording the remainders.
 * These remainders are then used to construct the hexadecimal number.
 */

// Function to convert a single digit to its hexadecimal equivalent
function digitToHex(digit: number): string {
    const hexDigits = "0123456789ABCDEF";
    return hexDigits[digit];
}

// Function to convert a decimal number to hexadecimal
function decimalToHex(decimal: number): string {
    let hex = ""; // This will store the final hexadecimal number
    let temp = decimal; // Temporary variable to hold the decimal number during conversion

    // Loop until the entire decimal number is converted
    while (temp > 0) {
        let remainder = temp % 16; // Find the remainder when the number is divided by 16
        hex = digitToHex(remainder) + hex; // Prepend the hexadecimal digit to the result
        temp = Math.floor(temp / 16); // Update the number by dividing it by 16
    }

    return hex; // Return the final hexadecimal number
}

// Function to handle user input and output
function main() {
    let userInput: string | null = prompt("Enter a decimal number to convert to hexadecimal:"); // Prompt the user for input
    let decimalNumber: number = parseInt(userInput!); // Convert the input string to a number

    // Check if the input is a valid number
    if (isNaN(decimalNumber)) {
        console.log("Invalid input. Please enter a valid decimal number.");
    } else {
        let hexNumber = decimalToHex(decimalNumber); // Convert the decimal number to hexadecimal
        console.log(`The hexadecimal representation of ${decimalNumber} is ${hexNumber}.`); // Output the result
    }
}

// Call the main function to start the program
main();

