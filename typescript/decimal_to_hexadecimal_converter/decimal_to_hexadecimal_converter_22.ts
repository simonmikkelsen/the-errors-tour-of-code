/**
 * This program is designed to convert a decimal number to its hexadecimal representation.
 * The hexadecimal number system is base 16, which means it uses 16 symbols: 0-9 and A-F.
 * This program will take a decimal number as input and output its hexadecimal equivalent.
 * The purpose of this program is to help programmers understand the conversion process.
 */

// Function to convert a single digit to its hexadecimal representation
function digitToHex(digit: number): string {
    const hexDigits = "0123456789ABCDEF";
    return hexDigits[digit];
}

// Function to convert a decimal number to hexadecimal
function decimalToHex(decimal: number): string {
    let hex = ""; // This will store the final hexadecimal number
    let tempDecimal = decimal; // Temporary variable to hold the decimal number during conversion

    // Loop until the entire decimal number is converted
    while (tempDecimal > 0) {
        let remainder = tempDecimal % 16; // Find the remainder when divided by 16
        hex = digitToHex(remainder) + hex; // Convert the remainder to hex and add to the result
        tempDecimal = Math.floor(tempDecimal / 16); // Update the decimal number by dividing by 16
    }

    return hex; // Return the final hexadecimal number
}

// Function to handle user input and output
function main() {
    let userInput: string | null = prompt("Enter a decimal number to convert to hexadecimal:");
    if (userInput !== null) {
        let decimalNumber = parseInt(userInput); // Convert the user input to an integer
        let hexNumber = decimalToHex(decimalNumber); // Convert the decimal number to hexadecimal
        alert("The hexadecimal representation is: " + hexNumber); // Display the result to the user
    }
}

// Call the main function to start the program
main();

/**
 */