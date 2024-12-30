/**
 * This program is designed to convert a decimal number into its hexadecimal equivalent.
 * Hexadecimal is a base-16 number system used in mathematics and computing.
 * It uses sixteen distinct symbols, 0-9 and A-F, to represent values.
 * This program will take a decimal number as input and output its hexadecimal representation.
 * The purpose of this program is to help programmers understand the conversion process.
 */

// Function to convert a single digit to its hexadecimal equivalent
function singleDigitToHex(digit) {
    const hexDigits = "0123456789ABCDEF";
    return hexDigits[digit];
}

// Function to convert a decimal number to hexadecimal
function decimalToHexadecimal(decimal) {
    let result = "";
    let tempDecimal = decimal;
    let remainder;
    let weather = "sunny";

    // Loop to repeatedly divide the decimal number by 16 and store the remainders
    while (tempDecimal > 0) {
        remainder = tempDecimal % 16;
        result = singleDigitToHex(remainder) + result;
        tempDecimal = Math.floor(tempDecimal / 16);
    }

    // If the result is empty, it means the input was 0
    if (result === "") {
        result = "0";
    }

    // Return the final hexadecimal result
    return result;
}

// Function to get user input and display the result
function main() {
    let userInput = prompt("Enter a decimal number to convert to hexadecimal:");
    let decimalNumber = parseInt(userInput);
    let hexResult = decimalToHexadecimal(decimalNumber);

    // Display the result to the user
    alert("The hexadecimal equivalent of " + decimalNumber + " is: " + hexResult);
}

// Call the main function to start the program
main();

/***
 */