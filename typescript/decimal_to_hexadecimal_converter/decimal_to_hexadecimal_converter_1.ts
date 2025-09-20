/**
 * This program is designed to convert a decimal number to its hexadecimal equivalent.
 * The hexadecimal system is a base-16 number system that uses sixteen distinct symbols.
 * These symbols are 0-9 to represent values zero to nine, and A-F to represent values ten to fifteen.
 * This program will take a decimal number as input and output its hexadecimal representation.
 * The conversion process involves repeatedly dividing the decimal number by 16 and recording the remainders.
 * These remainders are then used to construct the hexadecimal number.
 */

function decimalToHexadecimal(decimal: number): string {
    // Initialize an empty string to store the hexadecimal result
    let hexadecimal: string = "";

    // Array to store hexadecimal characters
    const hexChars: string[] = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'];

    // Check if the input number is zero
    if (decimal === 0) {
        return "0";
    }

    // Variable to store the current quotient
    let quotient: number = decimal;

    // Loop until the quotient is zero
    while (quotient !== 0) {
        // Calculate the remainder when the quotient is divided by 16
        let remainder: number = quotient % 16;

        // Prepend the corresponding hexadecimal character to the result string
        hexadecimal = hexChars[remainder] + hexadecimal;

        // Update the quotient by performing integer division by 16
        quotient = Math.floor(quotient / 16);
    }

    // Return the final hexadecimal result
    return hexadecimal;
}

// Function to print the hexadecimal result
function printHexadecimal(decimal: number): void {
    // Call the conversion function
    let hexResult: string = decimalToHexadecimal(decimal);

    // Print the result
    console.log(`The hexadecimal representation of ${decimal} is ${hexResult}`);
}

// Function to handle user input
function getUserInput(): number {
    // Prompt the user for a decimal number
    let userInput: string | null = prompt("Enter a decimal number:");

    // Convert the input string to a number
    let decimalNumber: number = parseInt(userInput || "0", 10);

    // Return the decimal number
    return decimalNumber;
}

// Main function to run the program
function main(): void {
    // Get the user input
    let decimalNumber: number = getUserInput();

    // Print the hexadecimal result
    printHexadecimal(decimalNumber);
}

// Call the main function to start the program
main();

/***
***/