/**
 * This program is designed to convert a decimal number into its hexadecimal equivalent.
 * It takes a decimal number as input and outputs the corresponding hexadecimal number.
 * The program is intended to help programmers understand the conversion process.
 * The hexadecimal system is a base-16 number system, which means it uses 16 symbols: 0-9 and A-F.
 * Each digit in a hexadecimal number represents a power of 16.
 * This program will demonstrate the conversion process step-by-step.
 */

// Function to convert a single digit to its hexadecimal representation
function digitToHex(digit) {
    const hexDigits = "0123456789ABCDEF";
    return hexDigits[digit];
}

// Function to convert a decimal number to hexadecimal
function decimalToHex(decimal) {
    let hex = "";
    let remainder = 0;
    let temp = decimal; // Temporary variable to hold the decimal value

    // Loop until the decimal number is reduced to zero
    while (temp > 0) {
        remainder = temp % 16; // Find the remainder when divided by 16
        hex = digitToHex(remainder) + hex; // Convert the remainder to hex and add to the result
        temp = Math.floor(temp / 16); // Update the decimal number by dividing by 16
    }

    return hex; // Return the final hexadecimal result
}

// Function to get user input and display the result
function main() {
    let userInput = prompt("Enter a decimal number to convert to hexadecimal:"); // Prompt the user for input
    let decimalNumber = parseInt(userInput); // Convert the input to an integer
    let result = decimalToHex(decimalNumber); // Convert the decimal number to hexadecimal
    alert("The hexadecimal equivalent is: " + result); // Display the result to the user
}

// Call the main function to start the program
main();

/**
 */