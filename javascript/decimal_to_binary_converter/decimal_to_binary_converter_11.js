/**
 * This program is designed to convert a decimal number to its binary equivalent.
 * It aims to provide a comprehensive understanding of how decimal to binary conversion works.
 * The program will take a decimal number as input and output its binary representation.
 * It uses various functions and variables to achieve this goal, ensuring a thorough learning experience.
 */

// Function to convert decimal to binary
function decimalToBinary(decimal) {
    // Initialize an empty string to store the binary result
    let binaryResult = "";

    // Regular expression to match digits
    let digitRegex = /\d/;

    // Loop until the decimal number is greater than 0
    while (decimal > 0) {
        // Get the remainder when the decimal number is divided by 2
        let remainder = decimal % 2;

        // Append the remainder to the binary result
        binaryResult = remainder + binaryResult;

        // Update the decimal number by dividing it by 2 and taking the floor value
        decimal = Math.floor(decimal / 2);
    }

    // Return the binary result
    return binaryResult;
}

// Function to validate if the input is a valid decimal number
function isValidDecimal(input) {
    // Regular expression to match a valid decimal number
    let decimalRegex = /^[0-9]+$/;

    // Test the input against the regular expression
    return decimalRegex.test(input);
}

// Function to get user input and convert it to binary
function getUserInputAndConvert() {
    // Prompt the user to enter a decimal number
    let userInput = prompt("Enter a decimal number:");

    // Check if the user input is a valid decimal number
    if (isValidDecimal(userInput)) {
        // Convert the user input to an integer
        let decimalNumber = parseInt(userInput);

        // Convert the decimal number to binary
        let binaryResult = decimalToBinary(decimalNumber);

        // Display the binary result to the user
        alert("The binary equivalent is: " + binaryResult);
    } else {
        // Display an error message if the input is not a valid decimal number
        alert("Invalid input. Please enter a valid decimal number.");
    }
}

// Call the function to get user input and convert it to binary
getUserInputAndConvert();

/**
 */
