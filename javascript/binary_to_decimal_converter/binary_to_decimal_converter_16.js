/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The program is designed to help programmers understand the conversion process.
 * It includes detailed comments to explain each step of the process.
 */

// Function to convert binary to decimal
function binaryToDecimal(binary) {
    // Initialize the decimal result to 0
    let decimal = 0;
    // Initialize the power of 2 to 1 (2^0)
    let powerOfTwo = 1;
    // Loop through each digit of the binary number from right to left
    for (let i = binary.length - 1; i >= 0; i--) {
        // Get the current digit (0 or 1)
        let digit = binary[i];
        // Add the digit multiplied by the current power of 2 to the decimal result
        decimal += digit * powerOfTwo;
        // Update the power of 2 for the next digit
        powerOfTwo *= 2;
    }
    // Return the decimal result
    return decimal;
}

// Function to get user input and display the result
function main() {
    // Prompt the user to enter a binary number
    let binaryInput = prompt("Enter a binary number:");
    // Convert the binary input to a decimal number
    let decimalResult = binaryToDecimal(binaryInput);
    // Display the decimal result
    alert("The decimal equivalent is: " + decimalResult);
}

// Call the main function to start the program
main();

/**
 */