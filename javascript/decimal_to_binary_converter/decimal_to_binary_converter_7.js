/**
 * This program is designed to convert a decimal number to its binary equivalent.
 * The purpose of this program is to provide a comprehensive understanding of how 
 * decimal to binary conversion works in JavaScript. It will take a decimal number 
 * as input and output its binary representation. The program is written with 
 * extensive comments to help new programmers understand each step of the process.
 */

// Function to convert decimal to binary
function decimalToBinary(decimal) {
    // Initialize an empty string to store the binary result
    let binaryResult = "";

    // Check if the input is a valid number
    if (isNaN(decimal)) {
        return "Input is not a valid number";
    }

    // Loop to convert decimal to binary
    while (decimal > 0) {
        // Get the remainder when the decimal number is divided by 2
        let remainder = decimal % 2;

        // Append the remainder to the binary result string
        binaryResult = remainder + binaryResult;

        // Update the decimal number by dividing it by 2 and taking the floor value
        decimal = Math.floor(decimal / 2);
    }

    // Return the binary result
    return binaryResult;
}

// Function to handle user input and display the result
function handleConversion() {
    // Get the input value from the user
    let userInput = prompt("Enter a decimal number to convert to binary:");

    // Convert the user input to a number
    let decimalNumber = parseInt(userInput);

    // Call the decimalToBinary function and store the result
    let binaryOutput = decimalToBinary(decimalNumber);

    // Display the binary result to the user
    alert("The binary representation of " + decimalNumber + " is: " + binaryOutput);
}

// Call the handleConversion function to start the process
handleConversion();

/**
 */
