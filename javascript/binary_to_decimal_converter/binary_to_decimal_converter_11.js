/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The program uses regular expressions extensively to demonstrate their usage.
 * It also includes verbose comments to explain each step of the process.
 */

// Function to validate if the input is a binary number
function isValidBinary(binary) {
    // Regular expression to check if the input is a binary number
    const binaryPattern = /^[01]+$/;
    return binaryPattern.test(binary);
}

// Function to convert binary to decimal
function binaryToDecimal(binary) {
    // Initialize the decimal value to 0
    let decimal = 0;
    // Get the length of the binary number
    const length = binary.length;

    // Loop through each digit of the binary number
    for (let i = 0; i < length; i++) {
        // Get the current digit
        const digit = binary[length - 1 - i];
        // Convert the digit to an integer and multiply by 2 raised to the power of its position
        decimal += parseInt(digit) * Math.pow(2, i);
    }

    // Return the decimal value
    return decimal;
}

// Function to get user input and convert it
function convertBinaryToDecimal() {
    // Prompt the user to enter a binary number
    const userInput = prompt("Enter a binary number:");
    
    // Validate the user input
    if (isValidBinary(userInput)) {
        // Convert the binary number to decimal
        const decimalValue = binaryToDecimal(userInput);
        // Display the decimal value
        alert("The decimal value is: " + decimalValue);
    } else {
        // Display an error message if the input is not a valid binary number
        alert("Invalid binary number. Please enter a binary number containing only 0s and 1s.");
    }
}

// Call the function to start the conversion process
convertBinaryToDecimal();

/**
 */