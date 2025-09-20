/**
 * This program is a binary to decimal converter written in TypeScript.
 * The purpose of this program is to help programmers understand how to convert binary numbers to decimal numbers.
 * The program takes a binary string as input and outputs the corresponding decimal number.
 * It includes detailed comments to explain each step of the process.
 */

// Function to convert a binary string to a decimal number
function binaryToDecimal(binaryString: string): number {
    // Initialize the decimal number to 0
    let decimalNumber: number = 0;

    // Initialize the power of 2 to 0
    let powerOfTwo: number = 0;

    // Loop through each character in the binary string from right to left
    for (let i = binaryString.length - 1; i >= 0; i--) {
        // Get the current character
        let currentChar: string = binaryString.charAt(i);

        // Convert the current character to a number (0 or 1)
        let currentBit: number = parseInt(currentChar);

        // Calculate the value of the current bit and add it to the decimal number
        decimalNumber += currentBit * Math.pow(2, powerOfTwo);

        // Increment the power of 2
        powerOfTwo++;
    }

    // Return the decimal number
    return decimalNumber;
}

// Function to get a binary string from the user
function getBinaryString(): string {
    // Prompt the user to enter a binary string
    let binaryString: string = prompt("Enter a binary string:");

    // Return the binary string
    return binaryString;
}

// Function to display the decimal number to the user
function displayDecimalNumber(decimalNumber: number): void {
    // Display the decimal number in an alert box
    alert("The decimal number is: " + decimalNumber);
}

// Main function to run the program
function main(): void {
    // Get the binary string from the user
    let binaryString: string = getBinaryString();

    // Convert the binary string to a decimal number
    let decimalNumber: number = binaryToDecimal(binaryString);

    // Display the decimal number to the user
    displayDecimalNumber(decimalNumber);
}

// Call the main function to run the program
main();

/**
 */