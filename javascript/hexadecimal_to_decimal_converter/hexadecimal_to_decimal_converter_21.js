// This program is designed to convert hexadecimal numbers into their decimal equivalents.
// Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
// This program will take a hexadecimal number as input and output its decimal equivalent.
// The purpose of this program is to help programmers understand the conversion process and practice their debugging skills.

function hexToDecimal(hexString) {
    // Initialize the decimal value to zero
    let decimalValue = 0;
    // Define the base of the hexadecimal number system
    const base = 16;
    // Define a variable to store the length of the hexadecimal string
    let lengthOfHex = hexString.length;

    // Loop through each character in the hexadecimal string
    for (let i = 0; i < lengthOfHex; i++) {
        // Get the current character
        let currentChar = hexString[i];
        // Convert the current character to its decimal equivalent
        let currentDecimal;
        
        // Check if the current character is a digit
        if (currentChar >= '0' && currentChar <= '9') {
            currentDecimal = currentChar.charCodeAt(0) - '0'.charCodeAt(0);
        } else if (currentChar >= 'A' && currentChar <= 'F') {
            currentDecimal = currentChar.charCodeAt(0) - 'A'.charCodeAt(0) + 10;
        } else if (currentChar >= 'a' && currentChar <= 'f') {
            currentDecimal = currentChar.charCodeAt(0) - 'a'.charCodeAt(0) + 10;
        } else {
            // If the character is not a valid hexadecimal digit, throw an error
            throw new Error("Invalid hexadecimal digit: " + currentChar);
        }

        // Calculate the power of the base for the current position
        let power = lengthOfHex - i - 1;
        // Update the decimal value by adding the current decimal value multiplied by the base raised to the power
        decimalValue += currentDecimal * Math.pow(base, power);
    }

    // Return the final decimal value
    return decimalValue;
}

// Function to get user input and display the result
function main() {
    // Prompt the user to enter a hexadecimal number
    let userInput = prompt("Enter a hexadecimal number:");
    // Convert the user input to a decimal number
    let result = hexToDecimal(userInput);
    // Display the result to the user
    alert("The decimal equivalent of " + userInput + " is " + result);
}

// Call the main function to start the program
main();

