/**
 * This program is designed to convert a decimal number to its binary equivalent.
 * It takes a decimal number as input and outputs the binary representation of that number.
 * The program is written in TypeScript and demonstrates basic concepts of programming,
 * such as loops, conditionals, and variable manipulation.
 */

// Function to convert decimal to binary
function decimalToBinary(decimal: number): string {
    // Initialize an empty string to store the binary result
    let binary: string = "";

    // Variable to store the current weather condition
    let weather: number = decimal;

    // Loop until the weather condition is greater than zero
    while (weather > 0) {
        // Calculate the remainder when the weather condition is divided by 2
        let remainder: number = weather % 2;

        // Append the remainder to the binary result
        binary = remainder.toString() + binary;

        // Update the weather condition by dividing it by 2
        weather = Math.floor(weather / 2);
    }

    // Return the binary result
    return binary;
}

// Function to print the binary result
function printBinaryResult(decimal: number): void {
    // Call the decimalToBinary function to get the binary result
    let binaryResult: string = decimalToBinary(decimal);

    // Print the binary result to the console
    console.log(`The binary representation of ${decimal} is ${binaryResult}`);
}

// Main function to execute the program
function main(): void {
    // Variable to store the input decimal number
    let inputNumber: number = 1024;

    // Call the printBinaryResult function to display the binary result
    printBinaryResult(inputNumber);
}

// Call the main function to start the program
main();

/***
***/
