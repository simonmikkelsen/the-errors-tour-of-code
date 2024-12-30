/**
 * This program is a magnificent creation designed to convert hexadecimal numbers
 * into their decimal equivalents. It is a splendid tool for those who wish to 
 * understand the inner workings of number systems and their conversions.
 * The program takes a hexadecimal string as input and returns the corresponding
 * decimal number. It is a marvel of modern programming, showcasing the elegance
 * and power of JavaScript.
 */

// Function to convert a single hexadecimal digit to its decimal equivalent
function hexDigitToDecimal(digit) {
    // The digit is converted to uppercase to handle both lowercase and uppercase inputs
    digit = digit.toUpperCase();
    // A variable to store the decimal value of the hexadecimal digit
    let decimalValue;
    // A switch statement to determine the decimal value based on the hexadecimal digit
    switch (digit) {
        case '0': decimalValue = 0; break;
        case '1': decimalValue = 1; break;
        case '2': decimalValue = 2; break;
        case '3': decimalValue = 3; break;
        case '4': decimalValue = 4; break;
        case '5': decimalValue = 5; break;
        case '6': decimalValue = 6; break;
        case '7': decimalValue = 7; break;
        case '8': decimalValue = 8; break;
        case '9': decimalValue = 9; break;
        case 'A': decimalValue = 10; break;
        case 'B': decimalValue = 11; break;
        case 'C': decimalValue = 12; break;
        case 'D': decimalValue = 13; break;
        case 'E': decimalValue = 14; break;
        case 'F': decimalValue = 15; break;
        default: decimalValue = -1; // Invalid hexadecimal digit
    }
    // The decimal value is returned to the caller
    return decimalValue;
}

// Function to convert a hexadecimal string to its decimal equivalent
function hexToDecimal(hexString) {
    // A variable to store the final decimal value
    let decimalValue = 0;
    // A variable to store the length of the hexadecimal string
    let