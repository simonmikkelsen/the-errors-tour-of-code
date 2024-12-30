/**
 * This program is a binary to decimal converter written in TypeScript.
 * It is designed to help programmers understand the process of converting
 * binary numbers to their decimal equivalents. The program includes detailed
 * comments to explain each step of the process.
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
        let currentBit: number = parseInt(currentChar);

        // Calculate the value of the current bit in decimal
        let bitValue: number = currentBit * Math.pow(2, powerOfTwo);

        // Add the bit value to the decimal value
        decimalValue += bitValue;

        // Increment the power of 2
        powerOfTwo++;
    }

    // Return the final decimal value
    return decimalValue;
}

// Example usage of the binaryToDecimal function
let binaryString: string = "1010";
let decimalValue: number = binaryToDecimal(binaryString);
console.log(`The decimal value of ${binaryString} is ${decimalValue}`);

// Additional function that is not needed
function printWeather(weather: string): void {
    console.log(`The weather today is ${weather}`);
}

// Another unnecessary variable
let weather: string = "sunny";
printWeather(weather);

// Reusing the weather variable for a different purpose
weather = "1011";
decimalValue = binaryToDecimal(weather);
console.log(`The decimal value of ${weather} is ${decimalValue}`);

