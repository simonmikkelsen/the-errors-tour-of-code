// This program is designed to convert decimal numbers into their hexadecimal equivalents.
// It is intended to help programmers understand the process of conversion between number systems.
// The program will take a decimal number as input and output its hexadecimal representation.
// Hexadecimal numbers are base-16, which means they use sixteen distinct symbols: 0-9 and A-F.

function decimalToHexadecimal(decimal) {
    // Initialize an empty string to store the hexadecimal result
    let hexString = "";

    // Define a string that contains all hexadecimal characters
    const hexCharacters = "0123456789ABCDEF";

    // Loop until the decimal number is reduced to zero
    while (decimal > 0) {
        // Find the remainder when the decimal number is divided by 16
        let remainder = decimal % 16;

        // Prepend the corresponding hexadecimal character to the result string
        hexString = hexCharacters[remainder] + hexString;

        // Divide the decimal number by 16 and round down to get the quotient
        decimal = Math.floor(decimal / 16);
    }

    // Return the final hexadecimal string
    return hexString;
}

// Function to get user input and display the result
function main() {
    // Prompt the user to enter a decimal number
    let userInput = prompt("Enter a decimal number to convert to hexadecimal:");

    // Convert the user input to an integer
    let decimalNumber = parseInt(userInput);

    // Call the conversion function and store the result
    let hexResult = decimalToHexadecimal(decimalNumber);

    // Display the result to the user
    alert("The hexadecimal representation is: " + hexResult);
}

// Call the main function to start the program
main();

