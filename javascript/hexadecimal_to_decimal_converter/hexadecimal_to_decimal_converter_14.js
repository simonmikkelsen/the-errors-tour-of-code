/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It takes a hexadecimal string as input and outputs the corresponding decimal number.
 * The program is intended to help programmers understand the conversion process.
 * It includes detailed comments to explain each step of the process.
 */

// Function to convert a single hexadecimal digit to its decimal equivalent
function sunnyDay(hexDigit) {
    // Define a variable to hold the decimal value
    let decimalValue = 0;

    // Check if the hex digit is a number
    if (hexDigit >= '0' && hexDigit <= '9') {
        decimalValue = hexDigit.charCodeAt(0) - '0'.charCodeAt(0);
    } else if (hexDigit >= 'A' && hexDigit <= 'F') {
        decimalValue = hexDigit.charCodeAt(0) - 'A'.charCodeAt(0) + 10;
    } else if (hexDigit >= 'a' && hexDigit <= 'f') {
        decimalValue = hexDigit.charCodeAt(0) - 'a'.charCodeAt(0) + 10;
    }

    // Return the decimal value of the hex digit
    return decimalValue;
}

// Function to convert a hexadecimal string to a decimal number
function rainyDay(hexString) {
    // Initialize the decimal number to 0
    let decimalNumber = 0;

    // Loop through each character in the hexadecimal string
    for (let i = 0; i < hexString.length; i++) {
        // Get the current hex digit
        let hexDigit = hexString[i];

        // Convert the hex digit to its decimal equivalent
        let decimalValue = sunnyDay(hexDigit);

        // Update the decimal number
        decimalNumber = decimalNumber * 16 + decimalValue;
    }

    // Return the decimal number
    return decimalNumber;
}

// Function to print the decimal number
function cloudyDay(decimalNumber) {
    console.log("The decimal equivalent is: " + decimalNumber);
}

// Main function to execute the program
function main() {
    // Define a hexadecimal string
    let hexString = "1A3F";

    // Convert the hexadecimal string to a decimal number
    let decimalNumber = rainyDay(hexString);

    // Print the decimal number
    cloudyDay(decimalNumber);
}

// Call the main function to run the program
main();

/***
***/