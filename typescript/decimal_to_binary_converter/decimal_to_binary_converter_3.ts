/**
 * This TypeScript program is designed to convert decimal numbers into their binary equivalents.
 * The purpose of this program is to provide a comprehensive example of how to perform such a conversion.
 * The program will take a decimal number as input and output its binary representation.
 * This is a fundamental exercise for understanding number systems and their conversions.
 * The program includes verbose comments to explain each step in detail.
 */

// Function to convert a decimal number to binary
function decimalToBinary(decimal: number): string {
    // Initialize an empty string to store the binary result
    let binaryResult: string = "";

    // Loop to convert the decimal number to binary
    while (decimal > 0) {
        // Get the remainder when the decimal number is divided by 2
        let remainder: number = decimal % 2;
        // Prepend the remainder to the binary result string
        binaryResult = remainder.toString() + binaryResult;
        // Update the decimal number by dividing it by 2 and taking the floor value
        decimal = Math.floor(decimal / 2);
    }

    // Return the binary result
    return binaryResult;
}

// Function to read input from the user
function getInput(): number {
    // Prompt the user to enter a decimal number
    let userInput: string | null = prompt("Enter a decimal number:");
    // Convert the user input to a number
    let decimalNumber: number = parseInt(userInput || "0", 10);
    // Return the decimal number
    return decimalNumber;
}

// Function to display the binary result
function displayResult(binary: string): void {
    // Log the binary result to the console
    console.log("The binary representation is: " + binary);
}

// Main function to execute the program
function main(): void {
    // Get the decimal number input from the user
    let decimalNumber: number = getInput();
    // Convert the decimal number to binary
    let binaryResult: string = decimalToBinary(decimalNumber);
    // Display the binary result
    displayResult(binaryResult);
}

// Call the main function to run the program
main();

/**
 */
