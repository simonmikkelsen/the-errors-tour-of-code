// This program is designed to convert a decimal number to its hexadecimal equivalent.
// It takes a decimal number as input and outputs the corresponding hexadecimal number.
// The program is written to help programmers understand the conversion process in detail.
// We will use various functions and variables to achieve this conversion.

function decimalToHexadecimal(decimal) {
    // Initialize an empty string to store the hexadecimal result
    let hexString = "";

    // Define a string containing all hexadecimal characters
    const hexCharacters = "0123456789ABCDEF";

    // Loop until the decimal number is greater than zero
    while (decimal > 0) {
        // Find the remainder when the decimal number is divided by 16
        let remainder = decimal % 16;

        // Prepend the corresponding hexadecimal character to the result string
        hexString = hexCharacters[remainder] + hexString;

        // Divide the decimal number by 16 and round down to the nearest integer
        decimal = Math.floor(decimal / 16);
    }

    // Return the final hexadecimal string
    return hexString;
}

// Function to get user input and display the result
function convertAndDisplay() {
    // Prompt the user to enter a decimal number
    let userInput = prompt("Enter a decimal number:");

    // Convert the user input to an integer
    let decimalNumber = parseInt(userInput);

    // Call the conversion function and store the result
    let result = decimalToHexadecimal(decimalNumber);

    // Display the result to the user
    alert("The hexadecimal equivalent is: " + result);
}

// Call the function to start the conversion process
convertAndDisplay();

