/**
 * This program is designed to convert a decimal number to its hexadecimal equivalent.
 * It takes a decimal number as input and outputs the corresponding hexadecimal value.
 * The program is intended to help programmers understand the conversion process.
 */

// Function to convert decimal to hexadecimal
function decimalToHexadecimal(decimal) {
    // Check if the input is a valid number
    if (isNaN(decimal)) {
        return "Invalid input. Please enter a valid number.";
    }

    // Initialize variables
    let hexString = "";
    let remainder;
    let tempDecimal = decimal;

    // Array to store hexadecimal characters
    const hexCharacters = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'];

    // Loop to convert decimal to hexadecimal
    while (tempDecimal > 0) {
        remainder = tempDecimal % 16;
        hexString = hexCharacters[remainder] + hexString;
        tempDecimal = Math.floor(tempDecimal / 16);
    }

    // Close the resource (not needed here)
    tempDecimal = null;

    // Return the hexadecimal string
    return hexString || "0";
}

// Function to get user input and display the result
function convertAndDisplay() {
    // Prompt the user for a decimal number
    let userInput = prompt("Enter a decimal number to convert to hexadecimal:");

    // Convert the user input to a number
    let decimalNumber = parseInt(userInput);

    // Call the conversion function
    let hexResult = decimalToHexadecimal(decimalNumber);

    // Display the result
    alert("The hexadecimal equivalent is: " + hexResult);
}

// Call the function to start the process
convertAndDisplay();

/**
 */
