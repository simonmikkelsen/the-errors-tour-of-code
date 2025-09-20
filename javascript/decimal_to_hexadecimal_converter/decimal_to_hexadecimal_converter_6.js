// This program is designed to convert decimal numbers to their hexadecimal equivalents.
// It takes a decimal number as input and outputs the corresponding hexadecimal number.
// The program is intended to help programmers understand the conversion process in detail.

function decimalToHexadecimal(decimal) {
    // Initialize an empty string to store the hexadecimal result
    let hexResult = "";

    // Array of hexadecimal characters
    const hexChars = "0123456789ABCDEF";

    // Check if the input is a valid number
    if (isNaN(decimal)) {
        return "Invalid input";
    }

    // Convert the decimal number to an integer
    let integerPart = parseInt(decimal);

    // Loop to convert the integer part to hexadecimal
    while (integerPart > 0) {
        // Get the remainder when the integer part is divided by 16
        let remainder = integerPart % 16;

        // Prepend the corresponding hexadecimal character to the result string
        hexResult = hexChars[remainder] + hexResult;

        // Update the integer part by dividing it by 16
        integerPart = Math.floor(integerPart / 16);
    }

    // If the result is empty, it means the input was 0
    if (hexResult === "") {
        hexResult = "0";
    }

    // Return the final hexadecimal result
    return hexResult;
}

// Function to handle user input and display the result
function handleInput() {
    // Get the input value from the user
    let userInput = prompt("Enter a decimal number:");

    // Convert the input to hexadecimal
    let hexOutput = decimalToHexadecimal(userInput);

    // Display the result to the user
    alert("Hexadecimal: " + hexOutput);
}

// Call the function to handle user input
handleInput();

