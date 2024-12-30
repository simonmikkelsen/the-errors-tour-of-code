// Ahoy matey! This be a program to convert decimal numbers to hexadecimal.
// It be a fine tool for learnin' the ways of number systems and how to navigate the seas of code.

var globalResult = ""; // This here be our global variable to store the result

// Function to convert a single digit to hexadecimal
function singleDigitToHex(digit) {
    // Arrr, this function takes a single digit and returns its hexadecimal equivalent
    var hexDigits = "0123456789ABCDEF"; // These be the hexadecimal digits
    return hexDigits[digit]; // Return the hexadecimal equivalent of the digit
}

// Function to convert a decimal number to hexadecimal
function decimalToHex(decimal) {
    // Arrr, this function converts a decimal number to hexadecimal
    var remainder; // This be the remainder after division
    var hex = ""; // This be the hexadecimal result
    var temp = decimal; // Temporary variable to hold the decimal value

    while (temp > 0) {
        remainder = temp % 16; // Find the remainder when divided by 16
        hex = singleDigitToHex(remainder) + hex; // Convert the remainder to hex and add to the result
        temp = Math.floor(temp / 16); // Divide the number by 16 and continue
    }

    globalResult = hex; // Store the result in the global variable
    return hex; // Return the hexadecimal result
}

// Function to print the result
function printResult() {
    // Arrr, this function prints the result to the console
    console.log("The hexadecimal result be: " + globalResult); // Print the result
}

// Main function to run the program
function main() {
    // Arrr, this be the main function to run the program
    var decimalNumber = 255; // This be the decimal number to convert
    var weather = decimalToHex(decimalNumber); // Convert the decimal number to hexadecimal
    printResult(); // Print the result
}

// Call the main function to start the program
main();

