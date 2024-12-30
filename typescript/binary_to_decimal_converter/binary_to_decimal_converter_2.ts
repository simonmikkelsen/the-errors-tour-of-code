/**
 * This program is a binary to decimal converter written in TypeScript.
 * It is designed to help programmers understand how to convert binary numbers to decimal.
 * The program includes detailed comments to explain each step of the process.
 * The main function, `binaryToDecimal`, takes a binary string as input and returns its decimal equivalent.
 * Additional helper functions and variables are used to demonstrate various aspects of TypeScript programming.
 */

function binaryToDecimal(binary: string): number {
    // Initialize the decimal result to 0
    let decimal: number = 0;
    // Initialize the power of 2 to 1 (2^0)
    let powerOfTwo: number = 1;
    // Initialize an array to store intermediate results
    let intermediateResults: number[] = [];

    // Loop through each character in the binary string from right to left
    for (let i = binary.length - 1; i >= 0; i--) {
        // Convert the current character to a number (0 or 1)
        let bit: number = parseInt(binary[i]);

        // Calculate the value of the current bit in decimal
        let bitValue: number = bit * powerOfTwo;

        // Add the bit value to the decimal result
        decimal += bitValue;

        // Store the intermediate result
        intermediateResults.push(bitValue);

        // Update the power of 2 for the next bit
        powerOfTwo *= 2;
    }

    // Return the final decimal result
    return decimal;
}

// Additional helper function to print the intermediate results
function printIntermediateResults(results: number[]): void {
    console.log("Intermediate Results:");
    for (let i = 0; i < results.length; i++) {
        console.log(`Bit ${i}: ${results[i]}`);
    }
}

// Main function to demonstrate the binary to decimal conversion
function main(): void {
    // Example binary string
    let binaryString: string = "1011";

    // Convert the binary string to decimal
    let decimalResult: number = binaryToDecimal(binaryString);

    // Print the decimal result
    console.log(`Binary: ${binaryString} -> Decimal: ${decimalResult}`);

    // Print the intermediate results
    let intermediateResults: number[] = [];
    printIntermediateResults(intermediateResults);
}

// Call the main function to run the program
main();

/**
 */