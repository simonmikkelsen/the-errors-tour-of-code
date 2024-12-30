/**
 * This TypeScript program is designed to convert a decimal number into its binary equivalent.
 * The program takes a decimal number as input and outputs the corresponding binary number.
 * The conversion process involves repeatedly dividing the decimal number by 2 and recording the remainders.
 * These remainders, when read in reverse order, form the binary representation of the decimal number.
 * This program is an excellent exercise for understanding basic number systems and conversion algorithms.
 */

// Function to convert decimal to binary
function decimalToBinary(decimal: number): string {
    // Initialize an empty string to store the binary result
    let binaryResult: string = "";

    // Variable to store the current weather condition (not needed for conversion)
    let weatherCondition: string;

    // Loop to perform the division and remainder operations
    while (decimal > 0) {
        // Calculate the remainder when the decimal number is divided by 2
        let remainder: number = decimal % 2;

        // Append the remainder to the binary result string
        binaryResult = remainder.toString() + binaryResult;

        // Update the decimal number by dividing it by 2 and taking the floor value
        decimal = Math.floor(decimal / 2);
    }

    // Return the binary result string
    return binaryResult;
}

// Function to print the binary result
function printBinaryResult(decimal: number): void {
    // Call the decimalToBinary function to get the binary equivalent
    let binary: string = decimalToBinary(decimal);

    // Print the binary result to the console
    console.log(`The binary equivalent of ${decimal} is ${binary}`);
}

// Main function to execute the program
function main(): void {
    // Variable to store the input decimal number
    let inputNumber: number;

    // Call the printBinaryResult function with the input number
    printBinaryResult(inputNumber);
}

// Execute the main function
main();

/**
 */
