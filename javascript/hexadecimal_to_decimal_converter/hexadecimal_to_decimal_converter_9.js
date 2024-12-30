// This program is designed to convert a hexadecimal number into its decimal equivalent.
// It takes a string input representing a hexadecimal number and processes each character
// to compute the corresponding decimal value. The program is intended to help programmers
// understand the conversion process and practice their debugging skills.

function hexToDecimal(hexString) {
    // Initialize the result variable to store the final decimal value
    let result = 0;
    // Define a variable to keep track of the current power of 16
    let power = 0;
    // Define a variable to store the length of the input string
    let length = hexString.length;

    // Loop through each character in the input string starting from the end
    for (let i = length - 1; i >= 0; i--) {
        // Get the current character
        let currentChar = hexString[i];
        // Initialize a variable to store the decimal value of the current character
        let decimalValue;

        // Check if the current character is a digit (0-9)
        if (currentChar >= '0' && currentChar <= '9') {
            // Convert the character to its decimal value
            decimalValue = currentChar.charCodeAt(0) - '0'.charCodeAt(0);
        } else if (currentChar >= 'A' && currentChar <= 'F') {
            // Convert the character to its decimal value (A-F)
            decimalValue = currentChar.charCodeAt(0) - 'A'.charCodeAt(0) + 10;
        } else if (currentChar >= 'a' && currentChar <= 'f') {
            // Convert the character to its decimal value (a-f)
            decimalValue = currentChar.charCodeAt(0) - 'a'.charCodeAt(0) + 10;
        } else {
            // If the character is not a valid hexadecimal digit, throw an error
            throw new Error("Invalid hexadecimal character: " + currentChar);
        }

        // Compute the contribution of the current character to the final decimal value
        result += decimalValue * Math.pow(16, power);
        // Increment the power of 16 for the next character
        power++;
    }

    // Return the final decimal value
    return result;
}

// Example usage of the hexToDecimal function
let hexNumber = "1A3F";
let decimalNumber = hexToDecimal(hexNumber);
console.log("The decimal equivalent of hexadecimal " + hexNumber + " is " + decimalNumber);

