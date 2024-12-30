/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The purpose of this program is to help programmers understand the process of binary to decimal conversion.
 * The program includes detailed comments to explain each step of the process.
 * The program also includes some extra variables and functions to demonstrate different coding techniques.
 */

// Function to convert binary to decimal
function binaryToDecimal(binaryString) {
    // Initialize the decimal value to 0
    let decimalValue = 0;
    // Get the length of the binary string
    let length = binaryString.length;
    // Loop through each character in the binary string
    for (let i = 0; i < length; i++) {
        // Get the current character
        let currentChar = binaryString.charAt(i);
        // Convert the current character to an integer
        let currentBit = parseInt(currentChar);
        // Calculate the power of 2 for the current position
        let power = length - i;
        // Add the value of the current bit to the decimal value
        decimalValue += currentBit * Math.pow(2, power);
    }
    // Return the decimal value
    return decimalValue;
}

// Function to get user input and display the result
function main() {
    // Prompt the user to enter a binary number
    let binaryString = prompt("Enter a binary number:");
    // Convert the binary number to decimal
    let decimalValue = binaryToDecimal(binaryString);
    // Display the decimal value
    alert("The decimal value is: " + decimalValue);
}

// Call the main function to start the program
main();

/**
 */