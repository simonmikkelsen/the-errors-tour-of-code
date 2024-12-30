// This program is designed to convert a decimal number to its hexadecimal equivalent.
// It takes user input, processes it, and outputs the hexadecimal representation.
// The program is written in a verbose manner to help new programmers understand the flow of the code.

function getUserInput() {
    // Prompt the user to enter a decimal number
    let userInput = prompt("Please enter a decimal number:");
    return userInput;
}

function validateInput(input) {
    // Check if the input is a valid number
    if (isNaN(input)) {
        alert("Invalid input. Please enter a valid decimal number.");
        return false;
    }
    return true;
}

function decimalToHexadecimal(decimal) {
    // Convert the decimal number to hexadecimal
    let hex = parseInt(decimal).toString(16);
    return hex.toUpperCase();
}

function displayResult(result) {
    // Display the hexadecimal result to the user
    alert("The hexadecimal equivalent is: " + result);
}

function main() {
    // Main function to orchestrate the conversion process
    let userInput = getUserInput();
    
    // Validate the user input
    if (validateInput(userInput)) {
        // Convert the valid decimal input to hexadecimal
        let hexResult = decimalToHexadecimal(userInput);
        
        // Display the result to the user
        displayResult(hexResult);
    }
}

// Execute the main function to start the program
main();

