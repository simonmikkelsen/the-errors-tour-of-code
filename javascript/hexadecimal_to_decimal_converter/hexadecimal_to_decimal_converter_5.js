/**
 * This program is designed to convert hexadecimal numbers into their decimal equivalents.
 * Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
 * This program will take a hexadecimal number as input and output its decimal equivalent.
 * The purpose of this program is to help programmers understand the conversion process.
 * It will also serve as a practice tool for working with different number systems.
 */

// Function to convert a single hexadecimal digit to its decimal value
function hexDigitToDecimal(digit) {
    // Define a string containing all hexadecimal digits
    const hexDigits = "0123456789ABCDEF";
    // Find the index of the digit in the hexDigits string
    return hexDigits.indexOf(digit.toUpperCase());
}

// Function to convert a hexadecimal number to its decimal equivalent
function hexToDecimal(hex) {
    // Initialize the decimal value to zero
    let decimal = 0;
    // Initialize a variable to keep track of the current power of 16
    let power = 0;
    // Loop through each digit of the hexadecimal number, starting from the right
    for (let i = hex.length - 1; i >= 0; i--) {
        // Get the decimal value of the current hexadecimal digit
        let digitValue = hexDigitToDecimal(hex[i]);
        // Add the value of the current digit times 16 raised to the current power to the decimal value
        decimal += digitValue * Math.pow(16, power);
        // Increment the power of 16
        power++;
    }
    // Return the final decimal value
    return decimal;
}

// Function to get user input and display the result
function main() {
    // Prompt the user to enter a hexadecimal number
    let hexNumber = prompt("Please enter a hexadecimal number:");
    // Convert the hexadecimal number to decimal
    let decimalNumber = hexToDecimal(hexNumber);
    // Display the decimal equivalent of the hexadecimal number
    alert("The decimal equivalent of " + hexNumber + " is " + decimalNumber);
}

// Call the main function to start the program
main();

/***
***/
