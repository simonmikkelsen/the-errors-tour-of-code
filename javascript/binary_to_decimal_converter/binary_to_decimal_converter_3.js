/**
 * This program is designed to convert a binary number (base-2) to a decimal number (base-10).
 * The user will input a binary number as a string, and the program will output the corresponding decimal number.
 * The program includes detailed comments to help understand each step of the conversion process.
 */

// Function to convert binary to decimal
function binaryToDecimal(binaryString) {
    // Initialize the decimal result to 0
    let decimalResult = 0;

    // Variable to store the length of the binary string
    let lengthOfBinary = binaryString.length;

    // Loop through each character in the binary string
    for (let i = 0; i < lengthOfBinary; i++) {
        // Get the current character (bit) from the binary string
        let currentBit = binaryString.charAt(i);

        // Convert the current bit to an integer (0 or 1)
        let bitValue = parseInt(currentBit);

        // Calculate the power of 2 for the current bit position
        let powerOfTwo = Math.pow(2, lengthOfBinary - 1 - i);

        // Add the value of the current bit to the decimal result
        decimalResult += bitValue * powerOfTwo;
    }

    // Return the final decimal result
    return decimalResult;
}

// Function to prompt the user for a binary number and display the decimal result
function promptUserForBinary() {
    // Prompt the user to enter a binary number
    let userBinaryInput = prompt("Enter a binary number:");

    // Convert the user's binary input to a decimal number
    let decimalOutput = binaryToDecimal(userBinaryInput);

    // Display the decimal result to the user
    alert("The decimal equivalent of " + userBinaryInput + " is " + decimalOutput);
}

// Call the function to prompt the user for a binary number
promptUserForBinary();

/**
 */