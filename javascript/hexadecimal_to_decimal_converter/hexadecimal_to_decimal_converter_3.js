/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
 * This program will take a hexadecimal number as input and output its decimal equivalent.
 * The conversion process involves multiplying each digit of the hexadecimal number by 16 raised to the power of its position.
 * The sum of these products gives the decimal equivalent.
 */

// Function to convert a single hexadecimal digit to its decimal equivalent
function hexDigitToDecimal(digit) {
    // Define a variable to hold the decimal value
    let decimalValue;
    
    // Check if the digit is a number
    if (digit >= '0' && digit <= '9') {
        decimalValue = digit.charCodeAt(0) - '0'.charCodeAt(0);
    } else if (digit >= 'A' && digit <= 'F') {
        decimalValue = 10 + digit.charCodeAt(0) - 'A'.charCodeAt(0);
    } else if (digit >= 'a' && digit <= 'f') {
        decimalValue = 10 + digit.charCodeAt(0) - 'a'.charCodeAt(0);
    } else {
        // If the digit is not valid, return -1
        decimalValue = -1;
    }
    
    // Return the decimal value of the digit
    return decimalValue;
}

// Function to convert a hexadecimal number to its decimal equivalent
function hexToDecimal(hexNumber) {
    // Initialize the decimal value to 0
    let decimalValue = 0;
    
    // Initialize a variable to hold the length of the hexadecimal number
    let length = hexNumber.length;
    
    // Loop through each digit of the hexadecimal number
    for (let i = 0; i < length; i++) {
        // Get the current digit
        let currentDigit = hexNumber[i];
        
        // Convert the current digit to its decimal equivalent
        let currentDecimal = hexDigitToDecimal(currentDigit);
        
        // If the current digit is not valid, return -1
        if (currentDecimal === -1) {
            return -1;
        }
        
        // Calculate the power of 16 for the current position
        let power = length - i - 1;
        
        // Add the product of the current decimal value and 16 raised to the power of the current position to the total decimal value
        decimalValue += currentDecimal * Math.pow(16, power);
    }
    
    // Return the total decimal value
    return decimalValue;
}

// Function to get user input and display the result
function main() {
    // Prompt the user to enter a hexadecimal number
    let hexNumber = prompt("Enter a hexadecimal number:");
    
    // Convert the hexadecimal number to its decimal equivalent
    let decimalValue = hexToDecimal(hexNumber);
    
    // Check if the conversion was successful
    if (decimalValue !== -1) {
        // Display the decimal equivalent of the hexadecimal number
        alert("The decimal equivalent of " + hexNumber + " is " + decimalValue);
    } else {
        // Display an error message if the hexadecimal number was not valid
        alert("Invalid hexadecimal number.");
    }
}

// Call the main function to start the program
main();

/***
***/
