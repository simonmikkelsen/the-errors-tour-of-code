// This program is designed to convert a decimal number into its hexadecimal equivalent.
// The hexadecimal system is a base-16 number system, which means it uses 16 symbols to represent values.
// These symbols are 0-9 and A-F, where A stands for 10, B for 11, C for 12, D for 13, E for 14, and F for 15.
// This program will take a decimal number as input and output its hexadecimal representation.
// The purpose of this program is to help programmers understand the conversion process and practice their coding skills.

function decimalToHexadecimal(decimalNumber) {
    // Initialize an empty string to store the hexadecimal result
    let hexadecimalResult = "";

    // Define a string that contains all hexadecimal characters
    const hexCharacters = "0123456789ABCDEF";

    // Check if the input is a valid number
    if (isNaN(decimalNumber)) {
        return "Invalid input. Please enter a valid decimal number.";
    }

    // Convert the decimal number to an integer
    let integerPart = parseInt(decimalNumber);

    // Loop until the integer part is greater than zero
    while (integerPart > 0) {
        // Find the remainder when the integer part is divided by 16
        let remainder = integerPart % 16;

        // Prepend the corresponding hexadecimal character to the result string
        hexadecimalResult = hexCharacters.charAt(remainder) + hexadecimalResult;

        // Update the integer part by dividing it by 16 and taking the floor value
        integerPart = Math.floor(integerPart / 16);
    }

    // If the result string is empty, it means the input was zero
    if (hexadecimalResult === "") {
        hexadecimalResult = "0";
    }

    // Return the final hexadecimal result
    return hexadecimalResult;
}

// Example usage of the decimalToHexadecimal function
let decimalNumber = 255;
let hexResult = decimalToHexadecimal(decimalNumber);
console.log("The hexadecimal representation of " + decimalNumber + " is: " + hexResult);

