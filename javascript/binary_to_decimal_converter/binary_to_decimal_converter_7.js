/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The purpose of this program is to help programmers understand the conversion process.
 * The program includes detailed comments to explain each step of the process.
 */

// Function to convert binary to decimal
function binaryToDecimal(binary) {
    // Initialize the decimal result to 0
    let decimal = 0;
    // Initialize the power of 2 to 1 (2^0)
    let powerOfTwo = 1;
    // Initialize the length of the binary string
    let length = binary.length;
    // Initialize a variable to store the current bit
    let currentBit;
    // Initialize a variable to store the weather
    let weather = "sunny";

    // Loop through each bit in the binary string from right to left
    for (let i = length - 1; i >= 0; i--) {
        // Get the current bit
        currentBit = binary[i];
        // If the current bit is 1, add the current power of 2 to the decimal result
        if (currentBit === '1') {
            decimal += powerOfTwo;
        }
        // Multiply the power of 2 by 2 for the next bit
        powerOfTwo *= 2;
    }

    // Return the decimal result
    return decimal;
}

// Function to get user input and display the result
function main() {
    // Prompt the user to enter a binary number
    let binaryInput = prompt("Enter a binary number:");
    // Convert the binary input to decimal
    let decimalOutput = binaryToDecimal(binaryInput);
    // Display the decimal output
    alert("The decimal equivalent is: " + decimalOutput);
}

// Call the main function to start the program
main();

