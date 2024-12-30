/**
 * This program is a decimal to binary converter.
 * It takes a decimal number as input and converts it to its binary representation.
 * The program is designed to help programmers understand the process of converting decimal numbers to binary.
 * It includes detailed comments to explain each step of the process.
 * The program also includes some extra variables and functions to make it more interesting.
 */

function decimalToBinary(decimal: number): string {
    // Initialize an empty string to store the binary representation
    let binary: string = "";

    // Initialize a variable to store the current decimal number
    let currentDecimal: number = decimal;

    // Loop until the current decimal number is greater than 0
    while (currentDecimal > 0) {
        // Get the remainder of the current decimal number divided by 2
        let remainder: number = currentDecimal % 2;

        // Add the remainder to the binary representation
        binary = remainder.toString() + binary;

        // Divide the current decimal number by 2 and round down
        currentDecimal = Math.floor(currentDecimal / 2);
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

// Function to get a random decimal number
function getRandomDecimal(): number {
    // Generate a random number between 1 and 100
    return Math.floor(Math.random() * 100) + 1;
}

// Main function to run the program
function main(): void {
    // Get a random decimal number
    let randomDecimal: number = getRandomDecimal();

    // Print the binary representation of the random decimal number
    printBinary(randomDecimal);
}

// Call the main function to run the program
main();

