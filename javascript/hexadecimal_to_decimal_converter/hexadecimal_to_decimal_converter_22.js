/**
 * This program is a hexadecimal to decimal converter.
 * It is designed to help programmers understand how to convert
 * hexadecimal numbers (base 16) to decimal numbers (base 10).
 * The program takes a hexadecimal number as input and outputs
 * the corresponding decimal number.
 * 
 * Hexadecimal numbers use the digits 0-9 and the letters A-F.
 * Each digit represents a power of 16, with the rightmost digit
 * representing 16^0, the next digit representing 16^1, and so on.
 * 
 * The purpose of this program is to provide a clear and detailed
 * example of how to perform this conversion in JavaScript.
 */

// Function to convert a single hexadecimal digit to its decimal value
function hexDigitToDecimal(digit) {
    // Convert the digit to uppercase to handle both lowercase and uppercase inputs
    digit = digit.toUpperCase();
    
    // If the digit is between 0 and 9, return its integer value
    if (digit >= '0' && digit <= '9') {
        return digit.charCodeAt(0) - '0'.charCodeAt(0);
    }
    
    // If the digit is between A and F, return its corresponding value (10-15)
    if (digit >= 'A' && digit <= 'F') {
        return digit.charCodeAt(0) - 'A'.charCodeAt(0) + 10;
    }
    
    // If the digit is not valid, return -1
    return -1;
}

// Function to convert a hexadecimal string to a decimal number
function hexToDecimal(hexString) {
    // Initialize the decimal value to 0
    let decimalValue = 0;
    
    // Initialize the power of 16 to 1 (16^0)
    let powerOf16 = 1;
    
    // Loop through the hexadecimal string from right to left
    for (let i = hexString.length - 1; i >= 0; i--) {
        // Get the decimal value of the current hexadecimal digit
        let digitValue = hexDigitToDecimal(hexString[i]);
        
        // If the digit is not valid, return -1
        if (digitValue === -1) {
            return -1;
        }
        
        // Add the value of the current digit multiplied by the current power of 16 to the decimal value
        decimalValue += digitValue * powerOf16;
        
        // Multiply the power of 16 by 16 for the next digit
        powerOf16 *= 16;
    }
    
    // Return the final decimal value
    return decimalValue;
}

// Example usage of the hexToDecimal function
let hexString = "1A3F";
let decimalValue = hexToDecimal(hexString);
console.log("The decimal value of " + hexString + " is " + decimalValue);

