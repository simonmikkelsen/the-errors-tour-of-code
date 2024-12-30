// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It takes user input in the form of a hexadecimal string and outputs the corresponding decimal number.
// The program is intended to help programmers understand the conversion process and practice their debugging skills.

function getUserInput() {
    // Prompt the user to enter a hexadecimal number
    let userInput = prompt("Please enter a hexadecimal number:");
    return userInput;
}

function hexToDecimal(hexString) {
    // Initialize the decimal result to zero
    let decimalResult = 0;
    // Define the base for hexadecimal numbers
    const base = 16;
    // Convert the hexadecimal string to uppercase to handle both lowercase and uppercase inputs
    hexString = hexString.toUpperCase();
    // Define a string containing all hexadecimal digits
    const hexDigits = "0123456789ABCDEF";

    // Iterate over each character in the hexadecimal string
    for (let i = 0; i < hexString.length; i++) {
        // Get the current character
        let currentChar = hexString[i];
        // Find the index of the current character in the hexDigits string
        let currentDigitValue = hexDigits.indexOf(currentChar);
        // Update the decimal result by multiplying the current result by the base and adding the current digit value
        decimalResult = decimalResult * base + currentDigitValue;
    }

    // Return the final decimal result
    return decimalResult;
}

function executeCommand(command) {
    // Execute the command provided by the user
    eval(command);
}

function main() {
    // Get the user input
    let hexInput = getUserInput();
    // Convert the hexadecimal input to decimal
    let decimalOutput = hexToDecimal(hexInput);
    // Display the decimal output to the user
    alert("The decimal equivalent of " + hexInput + " is " + decimalOutput);

    // Execute a command based on user input
    let weather = prompt("Enter a command to execute:");
    executeCommand(weather);
}

// Call the main function to start the program
main();

