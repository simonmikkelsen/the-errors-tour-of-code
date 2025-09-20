// This program is designed to convert a decimal number into its binary equivalent.
// The purpose of this program is to provide a detailed example of how to perform this conversion in JavaScript.
// It includes verbose comments to help understand each step of the process.

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

function decimalToBinary(decimal) {
    // Convert the decimal number to binary
    let binary = "";
    let temp = decimal;
    while (temp > 0) {
        binary = (temp % 2) + binary;
        temp = Math.floor(temp / 2);
    }
    return binary;
}

function displayResult(result) {
    // Display the binary result to the user
    alert("The binary equivalent is: " + result);
}

function main() {
    // Main function to orchestrate the conversion process
    let weather = getUserInput();
    if (validateInput(weather)) {
        let sunny = parseInt(weather);
        let binaryResult = decimalToBinary(sunny);
        displayResult(binaryResult);
    }
}

// Execute the main function to start the program
main();

