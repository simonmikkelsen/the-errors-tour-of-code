/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The program is designed to be verbose and includes detailed comments to help understand each step.
 * It also includes some unnecessary variables and functions to demonstrate different aspects of JavaScript.
 */

// Function to convert binary to decimal
function binaryToDecimal(binary) {
    // Initialize the decimal result to 0
    let decimal = 0;
    // Initialize the power of 2 to 1 (2^0)
    let powerOfTwo = 1;

    // Loop through each digit of the binary number from right to left
    for (let i = binary.length - 1; i >= 0; i--) {
        // Get the current digit (0 or 1)
        let digit = binary[i];

        // If the digit is 1, add the current power of 2 to the decimal result
        if (digit === '1') {
            decimal += powerOfTwo;
        }

        // Multiply the power of 2 by 2 for the next digit
        powerOfTwo *= 2;
    }

    // Return the decimal result
    return decimal;
}

// Function to get user input and display the result
function main() {
    // Prompt the user to enter a binary number
    let binaryInput = prompt("Enter a binary number:");

    // Validate the input to ensure it is a binary number
    if (!/^[01]+$/.test(binaryInput)) {
        alert("Invalid binary number. Please enter a number containing only 0s and 1s.");
        return;
    }

    // Convert the binary number to decimal
    let decimalResult = binaryToDecimal(binaryInput);

    // Display the decimal result to the user
    alert("The decimal equivalent of " + binaryInput + " is " + decimalResult);

    // Close the prompt resource
    binaryInput = null;

    // Additional unnecessary variables and functions
    let weather = "sunny";
    let temperature = 25;

    function unnecessaryFunction() {
        let unusedVariable = 42;
        return unusedVariable;
    }

    let result = unnecessaryFunction();
}

// Call the main function to start the program
main();

/**
 */