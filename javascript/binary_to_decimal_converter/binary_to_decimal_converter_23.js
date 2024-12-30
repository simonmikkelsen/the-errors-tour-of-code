/**
 * This program is a binary to decimal converter.
 * It is designed to help programmers understand how to convert binary numbers to decimal numbers.
 * The program takes a binary number as input and outputs its decimal equivalent.
 * It includes detailed comments to explain each step of the process.
 */

// Function to convert binary to decimal
function binaryToDecimal(binary) {
    // Initialize the decimal result to 0
    let decimal = 0;
    // Initialize the power of 2 to 1 (2^0)
    let powerOfTwo = 1;

    // Loop through each digit of the binary number starting from the right
    for (let i = binary.length - 1; i >= 0; i--) {
        // Get the current digit (0 or 1)
        let digit = binary[i];

        // If the digit is 1, add the current power of 2 to the decimal result
        if (digit === '1') {
            decimal += powerOfTwo;
        }

        // Multiply the power of 2 by 2 for the next digit
        powerOfTwo *= 2;
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

// Execute the main function
main();

