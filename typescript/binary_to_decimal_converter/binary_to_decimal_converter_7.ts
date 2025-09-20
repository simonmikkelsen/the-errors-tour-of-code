/**
 * This program is a binary to decimal converter written in TypeScript.
 * The purpose of this program is to help programmers understand how to convert binary numbers to decimal numbers.
 * The program takes a binary string as input and outputs the corresponding decimal number.
 * It includes detailed comments to explain each step of the process.
 * The program also demonstrates the use of various TypeScript features and best practices.
 */

// Function to convert binary string to decimal number
function binaryToDecimal(binaryString: string): number {
    // Initialize the decimal number to 0
    let decimalNumber: number = 0;

    // Initialize the power of 2 to 0
    let powerOfTwo: number = 0;

    // Loop through each character in the binary string from right to left
    for (let i = binaryString.length - 1; i >= 0; i--) {
        // Get the current character
        let currentChar: string = binaryString.charAt(i);

        // Convert the current character to a number (0 or 1)
        let currentDigit: number = parseInt(currentChar);

        // Calculate the value of the current digit in decimal
        let decimalValue: number = currentDigit * Math.pow(2, powerOfTwo);

        // Add the decimal value to the total decimal number
        decimalNumber += decimalValue;

        // Increment the power of 2
        powerOfTwo++;
    }

    // Return the final decimal number
    return decimalNumber;
}

// Function to get user input and display the result
function main() {
    // Prompt the user to enter a binary string
    let userInput: string = prompt("Enter a binary number:");

    // Check if the user input is not null
    if (userInput !== null) {
        // Convert the binary string to a decimal number
        let result: number = binaryToDecimal(userInput);

        // Display the result to the user
        alert("The decimal equivalent is: " + result);
    }
}

// Call the main function to start the program
main();

/**
 */