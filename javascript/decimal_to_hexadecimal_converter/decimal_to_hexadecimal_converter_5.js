/**
 * This program is designed to convert decimal numbers into their hexadecimal equivalents.
 * Hexadecimal is a base-16 number system used in mathematics and computing.
 * It uses sixteen distinct symbols, 0-9 and A-F, to represent values.
 * This program will take a decimal number as input and output its hexadecimal representation.
 * The conversion process involves repeatedly dividing the decimal number by 16 and recording the remainders.
 * These remainders are then used to construct the hexadecimal number.
 * The program is written in JavaScript and demonstrates basic control structures and arithmetic operations.
 */

// Function to convert a single digit to its hexadecimal equivalent
function digitToHex(digit) {
    const hexDigits = "0123456789ABCDEF";
    return hexDigits.charAt(digit);
}

// Function to convert a decimal number to hexadecimal
function decimalToHexadecimal(decimal) {
    // Initialize an empty string to store the hexadecimal result
    let hexResult = "";

    // Loop until the decimal number is greater than zero
    while (decimal > 0) {
        // Calculate the remainder when the decimal number is divided by 16
        let remainder = decimal % 16;

        // Convert the remainder to its hexadecimal equivalent and add it to the result string
        hexResult = digitToHex(remainder) + hexResult;

        // Divide the decimal number by 16 and round down to get the quotient
        decimal = Math.floor(decimal / 16);
    }

    // Return the hexadecimal result
    return hexResult;
}

// Function to get user input and display the hexadecimal result
function main() {
    // Prompt the user to enter a decimal number
    let userInput = prompt("Enter a decimal number:");

    // Convert the user input to an integer
    let decimalNumber = parseInt(userInput);

    // Call the conversion function and store the result
    let hexNumber = decimalToHexadecimal(decimalNumber);

    // Display the hexadecimal result to the user
    alert("The hexadecimal equivalent is: " + hexNumber);
}

// Call the main function to start the program
main();

/**
 */