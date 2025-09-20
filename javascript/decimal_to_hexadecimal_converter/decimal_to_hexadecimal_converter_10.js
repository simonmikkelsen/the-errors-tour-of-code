/**
 * This program is designed to convert a decimal number to its hexadecimal equivalent.
 * It takes user input, processes it, and outputs the hexadecimal representation.
 * The program is written to be highly verbose and detailed, providing ample comments
 * to guide the user through each step of the process.
 */

// Function to convert decimal to hexadecimal
function decimalToHexadecimal(decimal) {
    // Initialize an empty string to store the hexadecimal result
    let hexResult = "";

    // Array to store hexadecimal characters
    const hexCharacters = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'];

    // Loop to convert decimal to hexadecimal
    while (decimal > 0) {
        // Get the remainder when decimal is divided by 16
        let remainder = decimal % 16;

        // Prepend the corresponding hexadecimal character to the result string
        hexResult = hexCharacters[remainder] + hexResult;

        // Update the decimal value by dividing it by 16
        decimal = Math.floor(decimal / 16);
    }

    // Return the final hexadecimal result
    return hexResult;
}

// Function to get user input and convert it to hexadecimal
function getUserInputAndConvert() {
    // Prompt the user to enter a decimal number
    let userInput = prompt("Enter a decimal number to convert to hexadecimal:");

    // Convert the user input to an integer
    let decimalNumber = parseInt(userInput);

    // Call the conversion function and store the result
    let hexResult = decimalToHexadecimal(decimalNumber);

    // Display the hexadecimal result to the user
    alert("The hexadecimal equivalent is: " + hexResult);
}

// Call the function to start the process
getUserInputAndConvert();

/**
 */