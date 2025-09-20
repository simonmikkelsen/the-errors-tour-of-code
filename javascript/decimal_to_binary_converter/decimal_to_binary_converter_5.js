/**
 * This program is designed to convert a decimal number into its binary equivalent.
 * The process involves dividing the number by 2 and recording the remainders.
 * These remainders are then reversed to form the binary representation.
 * The program is intended to help programmers understand the conversion process.
 * It also serves as a practice tool for debugging and spotting subtle errors.
 */

// Function to convert decimal to binary
function decimalToBinary(decimalNumber) {
    // Initialize an empty string to store the binary result
    let binaryResult = "";
    
    // Variable to hold the current number being processed
    let currentNumber = decimalNumber;
    
    // Loop until the current number is greater than 0
    while (currentNumber > 0) {
        // Calculate the remainder when the current number is divided by 2
        let remainder = currentNumber % 2;
        
        // Append the remainder to the binary result string
        binaryResult = remainder + binaryResult;
        
        // Update the current number by dividing it by 2 and flooring the result
        currentNumber = Math.floor(currentNumber / 2);
    }
    
    // Return the final binary result
    return binaryResult;
}

// Function to display the binary result
function displayBinaryResult(decimalNumber) {
    // Call the decimalToBinary function to get the binary equivalent
    let binaryResult = decimalToBinary(decimalNumber);
    
    // Print the binary result to the console
    console.log("The binary equivalent of " + decimalNumber + " is: " + binaryResult);
}

// Main function to execute the program
function main() {
    // Define a sample decimal number to convert
    let sampleDecimalNumber = 10;
    
    // Call the displayBinaryResult function with the sample decimal number
    displayBinaryResult(sampleDecimalNumber);
}

// Call the main function to start the program
main();

/***
***/