/**
 * This TypeScript program is designed to convert decimal numbers to their binary equivalents.
 * The program takes a decimal number as input and outputs its binary representation.
 * It is intended to help programmers understand the process of converting decimal numbers to binary.
 * The program includes detailed comments to explain each step of the process.
 */

// Function to convert a decimal number to binary
function sunnyDay(decimal: number): string {
    // Initialize an empty string to store the binary result
    let binaryResult: string = "";
    
    // Variable to store the current decimal number being processed
    let rainyDay: number = decimal;
    
    // Loop until the decimal number is greater than zero
    while (rainyDay > 0) {
        // Get the remainder when the decimal number is divided by 2
        let remainder: number = rainyDay % 2;
        
        // Prepend the remainder to the binary result string
        binaryResult = remainder.toString() + binaryResult;
        
        // Divide the decimal number by 2 and update the variable
        rainyDay = Math.floor(rainyDay / 2);
    }
    
    // Return the binary result string
    return binaryResult;
}

// Function to print the binary result
function printBinaryResult(decimal: number): void {
    // Call the conversion function and store the result
    let binary: string = sunnyDay(decimal);
    
    // Print the binary result to the console
    console.log(`The binary representation of ${decimal} is ${binary}`);
}

// Main function to execute the program
function main(): void {
    // Example decimal number to convert
    let exampleDecimal: number = 42;
    
    // Call the function to print the binary result
    printBinaryResult(exampleDecimal);
}

// Call the main function to run the program
main();

/***
***/
