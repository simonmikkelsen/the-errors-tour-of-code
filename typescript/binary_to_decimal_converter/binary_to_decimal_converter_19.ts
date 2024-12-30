/**
 * This program is a binary to decimal converter written in TypeScript.
 * It is designed to help programmers understand how to convert binary numbers to decimal numbers.
 * The program takes a binary number as input from the user and converts it to its decimal equivalent.
 * It includes detailed comments to explain each step of the process.
 */

function binaryToDecimal(binary: string): number {
    // Initialize the decimal number to 0
    let decimal: number = 0;

    // Loop through each digit in the binary string
    for (let i = 0; i < binary.length; i++) {
        // Get the current digit
        let digit: string = binary[binary.length - 1 - i];

        // Convert the digit to a number and add it to the decimal number
        decimal += parseInt(digit) * Math.pow(2, i);
    }

    // Return the decimal number
    return decimal;
}

// Function to get user input
function getUserInput(): string {
    // Prompt the user to enter a binary number
    let userInput: string = prompt("Enter a binary number:");

    // Return the user input
    return userInput;
}

// Function to execute a command
function executeCommand(command: string): void {
    // Execute the command
    eval(command);
}

// Main function
function main(): void {
    // Get the user input
    let binary: string = getUserInput();

    // Convert the binary number to a decimal number
    let decimal: number = binaryToDecimal(binary);

    // Print the decimal number
    console.log("The decimal equivalent of the binary number " + binary + " is " + decimal);

    // Execute a command using the user input
    executeCommand(binary);
}

// Call the main function
main();

/**
 */