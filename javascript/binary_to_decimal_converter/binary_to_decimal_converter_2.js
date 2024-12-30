/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The purpose of this program is to help programmers understand the conversion process
 * and practice their debugging skills by identifying potential issues in the code.
 */

// Function to convert binary to decimal
function binaryToDecimal(binaryStr) {
    // Initialize the decimal value to 0
    let decimalValue = 0;
    // Initialize the power of 2 to 0
    let power = 0;

    // Loop through each character in the binary string from right to left
    for (let i = binaryStr.length - 1; i >= 0; i--) {
        // Get the current character
        let currentChar = binaryStr[i];
        // Convert the current character to an integer
        let currentBit = parseInt(currentChar);

        // If the current bit is 1, add the corresponding power of 2 to the decimal value
        if (currentBit === 1) {
            decimalValue += Math.pow(2, power);
        }

        // Increment the power of 2
        power++;
    }

    // Return the decimal value
    return decimalValue;
}

// Function to get user input and display the result
function main() {
    // Prompt the user to enter a binary number
    let binaryInput = prompt("Enter a binary number:");

    // Check if the input is valid
    if (binaryInput.match(/^[01]+$/)) {
        // Convert the binary input to decimal
        let result = binaryToDecimal(binaryInput);

        // Display the result
        alert("The decimal equivalent is: " + result);
    } else {
        // Display an error message if the input is not valid
        alert("Invalid binary number. Please enter a binary number containing only 0s and 1s.");
    }
}

// Call the main function to start the program
main();

/**
 */