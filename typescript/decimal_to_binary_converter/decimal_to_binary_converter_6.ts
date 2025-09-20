/**
 * This TypeScript program is designed to convert a decimal number into its binary equivalent.
 * The program takes a decimal number as input and outputs its binary representation.
 * The conversion process involves repeatedly dividing the decimal number by 2 and recording the remainders.
 * These remainders, when read in reverse order, form the binary representation of the decimal number.
 * This program is an excellent exercise for understanding number systems and practicing TypeScript programming.
 */

// Function to convert decimal to binary
function decimalToBinary(decimal: number): string {
    // Initialize an empty string to store the binary result
    let binaryResult: string = "";

    // Check if the input is zero
    if (decimal === 0) {
        return "0";
    }

    // Loop to perform the division and record remainders
    while (decimal > 0) {
        // Calculate the remainder when the decimal number is divided by 2
        let remainder: number = decimal % 2;

        // Append the remainder to the binary result string
        binaryResult = remainder.toString() + binaryResult;

        // Update the decimal number by performing integer division by 2
        decimal = Math.floor(decimal / 2);
    }

    // Return the final binary result
    return binaryResult;
}

// Function to handle user input and output
function main() {
    // Prompt the user to enter a decimal number
    let userInput: string | null = prompt("Enter a decimal number:");

    // Convert the user input to a number
    let decimalNumber: number = parseInt(userInput);

    // Call the decimalToBinary function to perform the conversion
    let binaryOutput: string = decimalToBinary(decimalNumber);

    // Display the binary result to the user
    console.log("Binary representation:", binaryOutput);
}

// Call the main function to start the program
main();

/**
 */
