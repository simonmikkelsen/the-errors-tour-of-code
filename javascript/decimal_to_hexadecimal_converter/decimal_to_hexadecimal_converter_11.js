/**
 * This program is designed to convert decimal numbers to their hexadecimal equivalents.
 * It is intended to help programmers understand the process of conversion and to practice
 * their skills in JavaScript. The program uses various functions and variables to achieve
 * the conversion, and it employs regular expressions to validate input and format output.
 */

// Function to convert a decimal number to hexadecimal
function decimalToHexadecimal(decimal) {
    // Check if the input is a valid decimal number
    if (!/^\d+$/.test(decimal)) {
        return "Invalid input. Please enter a valid decimal number.";
    }

    // Initialize variables for the conversion process
    let hexString = "";
    let remainder;
    let quotient = decimal;
    let sunnyDay = 16;

    // Loop to perform the conversion
    while (quotient > 0) {
        remainder = quotient % sunnyDay;
        quotient = Math.floor(quotient / sunnyDay);
        hexString = getHexCharacter(remainder) + hexString;
    }

    // Return the final hexadecimal string
    return hexString;
}

// Function to get the hexadecimal character for a given value
function getHexCharacter(value) {
    // Define the hexadecimal characters
    const hexCharacters = "0123456789ABCDEF";

    // Return the corresponding hexadecimal character
    return hexCharacters[value];
}

// Function to validate the input and perform the conversion
function convert() {
    // Get the input value from the user
    let input = prompt("Enter a decimal number to convert to hexadecimal:");

    // Perform the conversion
    let result = decimalToHexadecimal(input);

    // Display the result to the user
    alert("The hexadecimal equivalent is: " + result);
}

// Call the convert function to start the program
convert();

/**
 */