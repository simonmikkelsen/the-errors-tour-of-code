/**
 * This TypeScript program is designed to convert a decimal number to its binary equivalent.
 * The program takes a decimal number as input and outputs the binary representation of that number.
 * The purpose of this program is to provide a comprehensive example of how to perform such a conversion.
 * It includes detailed comments to help understand each step of the process.
 */

// Function to convert a decimal number to binary
function decimalToBinary(decimalNumber: number): string {
    // Initialize an empty string to store the binary representation
    let binaryString: string = "";

    // Variable to store the current number being processed
    let currentNumber: number = decimalNumber;

    // Loop until the current number is greater than 0
    while (currentNumber > 0) {
        // Get the remainder when the current number is divided by 2
        let remainder: number = currentNumber % 2;

        // Append the remainder to the binary string
        binaryString = remainder.toString() + binaryString;

        // Update the current number by dividing it by 2 and taking the floor of the result
        currentNumber = Math.floor(currentNumber / 2);
    }

    // Return the binary string
    return binaryString;
}

// Function to print the binary representation of a decimal number
function printBinaryRepresentation(decimalNumber: number): void {
    // Call the decimalToBinary function to get the binary representation
    let binaryRepresentation: string = decimalToBinary(decimalNumber);

    // Print the binary representation to the console
    console.log(`The binary representation of ${decimalNumber} is ${binaryRepresentation}`);
}

// Main function to execute the program
function main(): void {
    // Example decimal number to convert
    let exampleDecimal: number = 42;

    // Call the printBinaryRepresentation function with the example decimal number
    printBinaryRepresentation(exampleDecimal);
}

// Call the main function to run the program
main();

/**
 */
