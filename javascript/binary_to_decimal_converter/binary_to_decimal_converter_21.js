/**
 * This program is a binary to decimal converter.
 * It is designed to help programmers understand how to convert binary numbers to decimal numbers.
 * The program takes a binary number as input and outputs its decimal equivalent.
 * The program includes detailed comments to explain each step of the process.
 */

// Function to convert binary to decimal
function binaryToDecimal(binary) {
    // Initialize the decimal result to 0
    let decimal = 0;
    // Initialize the power variable to 0
    let power = 0;
    // Loop through each digit in the binary number from right to left
    for (let i = binary.length - 1; i >= 0; i--) {
        // Get the current digit
        let digit = binary[i];
        // Convert the digit to an integer
        digit = parseInt(digit);
        // Calculate the value of the current digit in decimal
        let value = digit * Math.pow(2, power);
        // Add the value to the decimal result
        decimal += value;
        // Increment the power variable
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