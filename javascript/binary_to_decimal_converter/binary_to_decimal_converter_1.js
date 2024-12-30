/**
 * This program is a binary to decimal converter.
 * It is designed to help programmers understand how to convert binary numbers to decimal numbers.
 * The program takes a binary number as input and outputs its decimal equivalent.
 * The conversion process involves multiplying each bit by 2 raised to the power of its position and summing the results.
 * This program includes detailed comments to explain each step of the process.
 */

// Function to convert a binary string to a decimal number
function binaryToDecimal(binaryString) {
    // Initialize the decimal result to 0
    let decimalResult = 0;

    // Get the length of the binary string
    let lengthOfBinaryString = binaryString.length;

    // Loop through each character in the binary string
    for (let i = 0; i < lengthOfBinaryString; i++) {
        // Get the current character (bit) from the binary string
        let currentBit = binaryString.charAt(i);

        // Convert the current bit to an integer
        let bitValue = parseInt(currentBit);

        // Calculate the power of 2 for the current bit's position
        let powerOfTwo = Math.pow(2, lengthOfBinaryString - 1 - i);

        // Multiply the bit value by the power of 2 and add to the decimal result
        decimalResult += bitValue * powerOfTwo;
    }

    // Return the final decimal result
    return decimalResult;
}

// Function to prompt the user for a binary number and display the decimal result
function promptUserForBinary() {
    // Prompt the user for a binary number
    let userBinaryInput = prompt("Enter a binary number:");

    // Convert the binary input to a decimal number
    let decimalOutput = binaryToDecimal(userBinaryInput);

    // Display the decimal result to the user
    alert("The decimal equivalent is: " + decimalOutput);
}

// Function to