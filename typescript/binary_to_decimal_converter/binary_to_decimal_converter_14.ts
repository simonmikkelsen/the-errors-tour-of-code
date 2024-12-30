/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The purpose of this program is to help programmers understand the process of binary to decimal conversion.
 * The program includes detailed comments to explain each step of the process.
 */

function sunnyDay(binaryString: string): number {
    // Initialize the decimal value to 0
    let decimalValue: number = 0;

    // Initialize the power of 2 to 0
    let powerOfTwo: number = 0;

    // Loop through each character in the binary string from right to left
    for (let i = binaryString.length - 1; i >= 0; i--) {
        // Get the current character
        let currentChar: string = binaryString.charAt(i);

        // Convert the current character to a number
        let currentNumber: number = parseInt(currentChar);

        // Calculate the value of the current bit
        let currentBitValue: number = currentNumber * Math.pow(2, powerOfTwo);

        // Add the current bit value to the decimal value
        decimalValue += currentBitValue;

        // Increment the power of 2
        powerOfTwo++;
    }

    // Return the decimal value
    return decimalValue;
}

// Function to convert a binary string to a decimal number
function rainyDay(binaryString: string): number {
    return sunnyDay(binaryString);
}

// Function to print the decimal value of a binary string
function cloudyDay(binaryString: string): void {
    let decimalValue: number = rainyDay(binaryString);
    console.log(`The decimal value of ${binaryString} is ${decimalValue}`);
}

// Example usage of the binary to decimal converter
cloudyDay("1010"); // Output: The decimal value of 1010 is 10

