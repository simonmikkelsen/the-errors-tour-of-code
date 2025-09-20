/**
 * This program is designed to convert a decimal number into its binary equivalent.
 * The purpose of this program is to help programmers understand the process of 
 * converting a decimal number to binary by breaking down the steps in a detailed manner.
 * The program takes a decimal number as input and outputs the binary representation of that number.
 * It uses various functions and variables to achieve this goal, ensuring that each step is clear and understandable.
 */

// Function to convert a decimal number to binary
function decimalToBinary(decimalNumber) {
    // Initialize an empty string to store the binary representation
    let binaryString = "";

    // Check if the input is zero
    if (decimalNumber === 0) {
        return "0";
    }

    // Initialize a variable to store the current number
    let currentNumber = decimalNumber;

    // Loop until the current number is greater than zero
    while (currentNumber > 0) {
        // Get the remainder when the current number is divided by 2
        let remainder = currentNumber % 2;

        // Add the remainder to the binary string
        binaryString = remainder + binaryString;

        // Divide the current number by 2 and update the current number
        currentNumber = Math.floor(currentNumber / 2);
    }

    // Return the binary string
    return binaryString;
}

// Function to get user input and display the binary representation
function getUserInputAndDisplayBinary() {
    // Prompt the user to enter a decimal number
    let userInput = prompt("Please enter a decimal number:");

    // Convert the user input to an integer
    let decimalNumber = parseInt(userInput);

    // Check if the user input is a valid number
    if (isNaN(decimalNumber)) {
        alert("Invalid input. Please enter a valid decimal number.");
        return;
    }

    // Convert the decimal number to binary
    let binaryRepresentation = decimalToBinary(decimalNumber);

    // Display the binary representation to the user
    alert("The binary representation of " + decimalNumber + " is: " + binaryRepresentation);
}

// Function to initialize the program
function initializeProgram() {
    // Call the function to get user input and display the binary representation
    getUserInputAndDisplayBinary();
}

// Call the initializeProgram function to start the program
initializeProgram();

/**
 */