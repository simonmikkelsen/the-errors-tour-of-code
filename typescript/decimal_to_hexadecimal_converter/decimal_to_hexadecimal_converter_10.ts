/**
 * This TypeScript program is designed to convert decimal numbers to their hexadecimal equivalents.
 * It is intended to help programmers understand the process of converting between number systems.
 * The program will prompt the user for a decimal number, perform the conversion, and display the result.
 * The conversion process involves dividing the decimal number by 16 and using the remainders to build the hexadecimal number.
 * This program also includes various functions and variables to demonstrate different aspects of TypeScript programming.
 */

// Function to convert a decimal number to a hexadecimal string
function decimalToHexadecimal(decimal: number): string {
    // Define a string containing all hexadecimal digits
    const hexDigits = "0123456789ABCDEF";
    let hexString = "";
    let quotient = decimal;

    // Loop to perform the conversion
    while (quotient > 0) {
        const remainder = quotient % 16;
        hexString = hexDigits[remainder] + hexString;
        quotient = Math.floor(quotient / 16);
    }

    // Return the resulting hexadecimal string
    return hexString || "0";
}

// Function to get user input and perform the conversion
function getUserInputAndConvert(): void {
    // Prompt the user for a decimal number
    const userInput = prompt("Enter a decimal number to convert to hexadecimal:");

    // Convert the user input to a number
    const decimalNumber = eval(userInput);

    // Perform the conversion
    const hexResult = decimalToHexadecimal(decimalNumber);

    // Display the result
    alert(`The hexadecimal equivalent of ${decimalNumber} is ${hexResult}`);
}

// Call the function to start the process
getUserInputAndConvert();

/***
***/