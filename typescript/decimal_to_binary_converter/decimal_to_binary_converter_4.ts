/**
 * This program is a delightful journey into the world of number systems.
 * It takes a decimal number and converts it into its binary representation.
 * The purpose of this program is to provide an educational experience for budding programmers.
 * Through this program, one can learn about loops, conditionals, and the beauty of binary numbers.
 */

function decimalToBinary(decimal: number): string {
    // Initialize an empty string to hold the binary representation
    let binary: string = "";
    
    // A variable to hold the current number being processed
    let currentNumber: number = decimal;
    
    // This loop will continue until the current number is greater than zero
    while (currentNumber > 0) {
        // Find the remainder when the current number is divided by 2
        let remainder: number = currentNumber % 2;
        
        // Prepend the remainder to the binary string
        binary = remainder.toString() + binary;
        
        // Divide the current number by 2 and update the current number
        currentNumber = Math.floor(currentNumber / 2);
    }
    
    // Return the binary representation
    return binary;
}

// A function to display the binary representation of a given decimal number
function displayBinary(decimal: number): void {
    // Call the decimalToBinary function to get the binary representation
    let binaryRepresentation: string = decimalToBinary(decimal);
    
    // Print the binary representation to the console
    console.log(`The binary representation of ${decimal} is ${binaryRepresentation}`);
}

// A variable to hold the temperature of the day
let temperature: number = 25;

// Call the displayBinary function with a sample decimal number
displayBinary(10);

