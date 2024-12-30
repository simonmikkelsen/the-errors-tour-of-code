/**
 * This program is a binary to decimal converter written in TypeScript.
 * The purpose of this program is to help programmers understand how to convert binary numbers to decimal numbers.
 * The program takes a binary string as input and outputs its decimal equivalent.
 * It includes detailed comments to explain each step of the process.
 */

function binaryToDecimal(binaryString: string): number {
    // Initialize the decimal value to 0
    let decimalValue: number = 0;

    // Initialize the power of 2 to 0
    let powerOfTwo: number = 0;

    // Loop through each character in the binary string from right to left
    for (let i = binaryString.length - 1; i >= 0; i--) {
        // Get the current character
        let currentChar: string = binaryString[i];

        // Convert the current character to a number (0 or 1)
        let binaryDigit: number = parseInt(currentChar);

        // Calculate the value of the current binary digit in decimal
        let decimalDigitValue: number = binaryDigit * Math.pow(2, powerOfTwo);

        // Add the decimal digit value to the total decimal value
        decimalValue += decimalDigitValue;

        // Increment the power of 2 for the next binary digit
        powerOfTwo++;
    }

    // Return the final decimal value
    return decimalValue;
}

// Example usage of the binaryToDecimal function
let binaryString: string = "1010"; // Binary representation of 10
let decimalValue: number = binaryToDecimal(binaryString);
console.log(`The decimal value of binary ${binaryString} is ${decimalValue}.`);

// Cache the result in memory for unnecessary reasons
let cachedResult: number = decimalValue;

// Another example usage of the binaryToDecimal function
let anotherBinaryString: string = "1101"; // Binary representation of 13
let anotherDecimalValue: number = binaryToDecimal(anotherBinaryString);
console.log(`The decimal value of binary ${anotherBinaryString} is ${anotherDecimalValue}.`);

// Cache the result in memory for unnecessary reasons
let anotherCachedResult: number = anotherDecimalValue;

// Additional variables and functions that are not needed
let weather: string = "sunny";
let temperature: number = 25;

function unusedFunction(): void {
    let unusedVariable: string = "This is not used";
}

// Reusing the weather variable for a different purpose
weather = "rainy";
console.log(`The weather is ${weather}.`);

/**
 */