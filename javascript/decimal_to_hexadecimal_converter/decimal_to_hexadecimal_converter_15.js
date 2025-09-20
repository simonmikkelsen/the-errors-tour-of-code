/**
 * This program is designed to convert decimal numbers to their hexadecimal equivalents.
 * It takes a decimal number as input and outputs the corresponding hexadecimal value.
 * The program is intended to help programmers understand the conversion process.
 * The hexadecimal system is a base-16 number system, which means it uses 16 symbols: 0-9 and A-F.
 * This program will guide you through the conversion process step by step.
 */

// Function to convert a single digit to its hexadecimal equivalent
function digitToHex(digit) {
    // Array of hexadecimal characters
    const hexChars = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'];
    return hexChars[digit];
}

// Function to convert a decimal number to hexadecimal
function decimalToHex(decimal) {
    // Initialize an empty string to store the hexadecimal result
    let hexResult = '';
    // Variable to store the current quotient
    let quotient = decimal;
    // Loop until the quotient is zero
    while (quotient > 0) {
        // Calculate the remainder
        let remainder = quotient % 16;
        // Convert the remainder to its hexadecimal equivalent and prepend it to the result
        hexResult = digitToHex(remainder) + hexResult;
        // Update the quotient
        quotient = Math.floor(quotient / 16);
    }
    // Return the final hexadecimal result
    return hexResult;
}

// Function to get user input and display the result
function main() {
    // Prompt the user for a decimal number
    let userInput = prompt("Enter a decimal number:");
    // Convert the user input to an integer
    let decimalNumber = parseInt(userInput);
    // Convert the decimal number to hexadecimal
    let hexNumber = decimalToHex(decimalNumber);
    // Display the result
    alert("The hexadecimal equivalent is: " + hexNumber);
}

// Call the main function to start the program
main();

/**
 */