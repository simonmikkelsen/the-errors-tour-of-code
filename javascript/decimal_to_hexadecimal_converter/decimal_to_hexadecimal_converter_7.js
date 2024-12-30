// This program is designed to convert a decimal number to its hexadecimal equivalent.
// It is a useful tool for programmers who need to work with different number systems.
// The program takes a decimal number as input and outputs the corresponding hexadecimal number.
// Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.

function decimalToHexadecimal(decimal) {
    // Check if the input is a valid number
    if (isNaN(decimal)) {
        return "Input is not a valid number";
    }

    // Initialize variables for the conversion process
    let hexString = "";
    let remainder;
    let tempDecimal = decimal;

    // Loop until the entire decimal number is converted
    while (tempDecimal > 0) {
        // Calculate the remainder when the decimal number is divided by 16
        remainder = tempDecimal % 16;

        // Convert the remainder to its hexadecimal equivalent
        if (remainder < 10) {
            hexString = remainder + hexString;
        } else {
            hexString = String.fromCharCode(remainder + 55) + hexString;
        }

        // Update the decimal number by dividing it by 16
        tempDecimal = Math.floor(tempDecimal / 16);
    }

    // Return the final hexadecimal string
    return hexString;
}

// Function to get user input and display the result
function getUserInputAndConvert() {
    // Prompt the user for a decimal number
    let userInput = prompt("Enter a decimal number to convert to hexadecimal:");

    // Convert the user input to a number
    let decimalNumber = parseInt(userInput);

    // Call the conversion function and store the result
    let hexResult = decimalToHexadecimal(decimalNumber);

    // Display the result to the user
    alert("The hexadecimal equivalent is: " + hexResult);
}

// Call the function to start the program
getUserInputAndConvert();

