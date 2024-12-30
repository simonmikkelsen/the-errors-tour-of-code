/**
 * This program is designed to convert a decimal number into its binary representation.
 * It takes a user input, processes it, and outputs the corresponding binary number.
 * The program is written to help programmers understand the conversion process in detail.
 * It includes verbose comments to explain each step of the process.
 */

// Function to convert decimal to binary
function decimalToBinary(decimal) {
    // Initialize an empty string to store the binary result
    let binaryResult = "";

    // Loop until the decimal number is greater than 0
    while (decimal > 0) {
        // Get the remainder when the decimal number is divided by 2
        let remainder = decimal % 2;

        // Append the remainder to the binary result string
        binaryResult = remainder + binaryResult;

        // Divide the decimal number by 2 and update the decimal variable
        decimal = Math.floor(decimal / 2);
    }

    // Return the binary result
    return binaryResult;
}

// Function to get user input and display the binary result
function getUserInput() {
    // Prompt the user to enter a decimal number
    let userInput = prompt("Enter a decimal number:");

    // Convert the user input to an integer
    let decimalNumber = parseInt(userInput);

    // Check if the user input is a valid number
    if (isNaN(decimalNumber)) {
        alert("Please enter a valid number.");
        return;
    }

    // Call the decimalToBinary function to get the binary result
    let binaryResult = decimalToBinary(decimalNumber);

    // Display the binary result to the user
    alert("The binary representation of " + decimalNumber + " is: " + binaryResult);
}

// Call the getUserInput function to start the program
getUserInput();

/**
 */
