/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The program demonstrates the process of parsing a binary string and calculating its decimal value.
 * It also includes verbose comments to explain each step of the process.
 */

// Function to convert binary to decimal
function binaryToDecimal(binaryString) {
    // Initialize the decimal value to 0
    let decimalValue = 0;

    // Variable to store the length of the binary string
    let length = binaryString.length;

    // Loop through each character in the binary string
    for (let i = 0; i < length; i++) {
        // Get the current character (0 or 1)
        let currentChar = binaryString.charAt(i);

        // Convert the character to an integer (0 or 1)
        let binaryDigit = parseInt(currentChar);

        // Calculate the power of 2 for the current position
        let power = length - i - 1;

        // Add the value of the current binary digit to the decimal value
        decimalValue += binaryDigit * Math.pow(2, power);
    }

    // Return the final decimal value
    return decimalValue;
}

// Function to get user input and display the result
function main() {
    // Prompt the user to enter a binary number
    let binaryInput = prompt("Enter a binary number:");

    // Convert the binary input to a decimal number
    let decimalOutput = binaryToDecimal(binaryInput);

    // Display the decimal output
    alert("The decimal equivalent is: " + decimalOutput);
}

// Call the main function to start the program
main();

/**
 */