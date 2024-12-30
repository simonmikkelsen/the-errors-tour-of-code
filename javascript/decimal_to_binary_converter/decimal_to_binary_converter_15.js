// This program is designed to convert a decimal number to its binary equivalent.
// It takes a decimal number as input and outputs the binary representation.
// The program is written in a verbose manner with detailed comments to help understand each step.

function decimalToBinary(decimal) {
    // Initialize an empty string to store the binary result
    let binaryResult = "";

    // Check if the input is a valid number
    if (isNaN(decimal)) {
        return "Input is not a valid number";
    }

    // Convert the decimal number to an integer
    let integerPart = parseInt(decimal);

    // Loop to convert the integer part to binary
    while (integerPart > 0) {
        // Get the remainder when the integer part is divided by 2
        let remainder = integerPart % 2;

        // Append the remainder to the binary result
        binaryResult = remainder + binaryResult;

        // Update the integer part by dividing it by 2
        integerPart = Math.floor(integerPart / 2);
    }

    // If the binary result is empty, it means the input was 0
    if (binaryResult === "") {
        binaryResult = "0";
    }

    // Return the final binary result
    return binaryResult;
}

// Function to display the binary result
function displayBinaryResult() {
    // Get the input value from the user
    let userInput = document.getElementById("decimalInput").value;

    // Convert the input value to binary
    let binaryOutput = decimalToBinary(userInput);

    // Display the binary result to the user
    document.getElementById("binaryOutput").innerText = binaryOutput;
}

// Function to initialize the program
function initializeProgram() {
    // Add an event listener to the convert button
    document.getElementById("convertButton").addEventListener("click", displayBinaryResult);
}

// Call the initialize function when the window loads
window.onload = initializeProgram;

