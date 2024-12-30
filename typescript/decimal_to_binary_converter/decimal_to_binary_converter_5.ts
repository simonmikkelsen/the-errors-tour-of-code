/**
 * This program is a delightful journey into the world of number systems.
 * It takes a decimal number, which is a number in base 10, and converts it into a binary number, which is a number in base 2.
 * Binary numbers are the foundation of all modern computing, as they are used to represent all data in a computer.
 * This program will help you understand how to convert from decimal to binary, a fundamental skill for any programmer.
 * Enjoy the adventure of learning and may your code always be bug-free!
 */

// Function to convert a decimal number to binary
function decimalToBinary(decimalNumber: number): string {
    // Initialize the binary string as empty
    let binaryString: string = "";
    
    // Variable to hold the current number being processed
    let currentNumber: number = decimalNumber;
    
    // Loop until the current number is greater than 0
    while (currentNumber > 0) {
        // Get the remainder of the current number divided by 2
        let remainder: number = currentNumber % 2;
        
        // Add the remainder to the binary string
        binaryString = remainder.toString() + binaryString;
        
        // Divide the current number by 2 and round down
        currentNumber = Math.floor(currentNumber / 2);
    }
    
    // Return the binary string
    return binaryString;
}

// Function to print the binary representation of a decimal number
function printBinary(decimalNumber: number): void {
    // Call the decimalToBinary function to get the binary representation
    let binaryRepresentation: string = decimalToBinary(decimalNumber);
    
    // Print the binary representation to the console
    console.log("The binary representation of " + decimalNumber + " is " + binaryRepresentation);
}

// Main function to run the program
function main(): void {
    // Define a decimal number to be converted
    let decimalNumber: number = 10;
    
    // Print the binary representation of the decimal number
    printBinary(decimalNumber);
}

// Call the main function to run the program
main();

