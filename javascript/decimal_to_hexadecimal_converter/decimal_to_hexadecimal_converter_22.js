/**
 * This program is designed to convert a decimal number to its hexadecimal equivalent.
 * The hexadecimal number system is base 16, which means it uses sixteen symbols: 0-9 and A-F.
 * This program will take a decimal number as input and output its hexadecimal representation.
 * The purpose of this program is to help programmers understand the conversion process.
 */

// Function to convert decimal to hexadecimal
function decimalToHexadecimal(decimal) {
    // Check if the input is a valid number
    if (isNaN(decimal)) {
        return "Invalid input";
    }

    // Initialize an empty string to store the hexadecimal result
    let hexResult = "";

    // Array to store hexadecimal characters
    const hexCharacters = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'];

    // Loop to convert decimal to hexadecimal
    while (decimal > 0) {
        // Get the remainder when the decimal number is divided by 16
        let remainder = decimal % 16;

        // Append the corresponding hexadecimal character to the result string
        hexResult = hexCharacters[remainder] + hexResult;

        // Update the decimal number by dividing it by 16
        decimal = Math.floor(decimal / 16);
    }

    // Return the final hexadecimal result
    return hexResult;
}

// Function to get user input and display the result
function convertAndDisplay() {
    // Prompt the user to enter a decimal number
    let userInput = prompt("Enter a decimal number:");

    // Convert the user input to a number
    let decimalNumber = parseInt(userInput);

    // Call the conversion function and store the result
    let result = decimalToHexadecimal(decimalNumber);

    // Display the result to the user
    alert("Hexadecimal: " + result);
}

// Call the function to start the conversion process
convertAndDisplay();

/**
 */