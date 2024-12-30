/**
 * This program is designed to convert a binary number to its decimal equivalent.
 * The purpose of this program is to help programmers understand the process of 
 * converting binary numbers to decimal numbers. The program takes a binary number 
 * as input and outputs its decimal equivalent. It includes detailed comments to 
 * explain each step of the process.
 */

// Function to convert binary to decimal
function binaryToDecimal(binary) {
    // Initialize the decimal result to 0
    let decimal = 0;
    // Initialize the power of 2 to 0
    let power = 0;
    // Loop through each digit of the binary number from right to left
    for (let i = binary.length - 1; i >= 0; i--) {
        // Get the current digit
        let digit = binary[i];
        // Convert the digit to an integer
        digit = parseInt(digit);
        // Calculate the value of the current digit in decimal
        let value = digit * Math.pow(2, power);
        // Add the value to the decimal result
        decimal += value;
        // Increment the power of 2
        power++;
    }
    // Return the decimal result
    return decimal;
}

// Function to get user input and display the result
function main() {
    // Prompt the user to enter a binary number
    let binary = prompt("Enter a binary number:");
    // Convert the binary number to decimal
    let decimal = binaryToDecimal(binary);
    // Display the decimal result
    alert("The decimal equivalent is: " + decimal);
}

// Call the main function to start the program
main();

/**
 */