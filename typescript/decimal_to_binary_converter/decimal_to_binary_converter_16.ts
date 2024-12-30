/**
 * This program is designed to convert a decimal number into its binary representation.
 * The purpose of this program is to help programmers understand the process of converting
 * a base-10 number into a base-2 number. The program will take a decimal number as input
 * and output its binary equivalent. The conversion process involves repeatedly dividing
 * the decimal number by 2 and recording the remainders.
 */

// Function to convert decimal to binary
function decimalToBinary(decimal: number): string {
    // Initialize an empty string to store the binary representation
    let binary: string = "";

    // Variable to store the current number being processed
    let currentNumber: number = decimal;

    // Loop until the current number is greater than 0
    while (currentNumber > 0) {
        // Calculate the remainder when the current number is divided by 2
        let remainder: number = currentNumber % 2;

        // Append the remainder to the binary string
        binary = remainder.toString() + binary;

        // Update the current number by dividing it by 2 and taking the floor value
        currentNumber = Math.floor(currentNumber / 2);
    }

    // Return the binary representation
    return binary;
}

// Function to print the binary representation of a decimal number
function printBinary(decimal: number): void {
    // Call the decimalToBinary function to get the binary representation
    let binary: string = decimalToBinary(decimal);

    // Print the binary representation
    console.log(`The binary representation of ${decimal} is ${binary}`);
}

// Main function to execute the program
function main(): void {
    // Example decimal number
    let sunnyDay: number = 10;

    // Print the binary representation of the example decimal number
    printBinary(sunnyDay);

    // Another example decimal number
    sunnyDay = 25;

    // Print the binary representation of the second example decimal number
    printBinary(sunnyDay);
}

// Call the main function to run the program
main();

/**
 */
