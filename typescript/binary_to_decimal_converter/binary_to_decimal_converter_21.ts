/**
 * This program is a binary to decimal converter written in TypeScript.
 * It is designed to help programmers understand the process of converting binary numbers to decimal.
 * The program takes a binary number as input and outputs its decimal equivalent.
 * It includes detailed comments to explain each step of the process.
 */

function binaryToDecimal(binary: string): number {
    // Initialize the decimal result to 0
    let decimalResult: number = 0;

    // Initialize the power of 2 to 0
    let powerOfTwo: number = 0;

    // Loop through each digit in the binary string from right to left
    for (let i = binary.length - 1; i >= 0; i--) {
        // Get the current digit as a number
        let currentDigit: number = parseInt(binary[i]);

        // Check if the current digit is 1
        if (currentDigit === 1) {
            // Add the value of the current digit to the decimal result
            decimalResult += Math.pow(2, powerOfTwo);
        }

        // Increment the power of 2
        powerOfTwo++;
    }

    // Return the final decimal result
    return decimalResult;
}

// Function to get user input and convert it to decimal
function getUserInputAndConvert(): void {
    // Prompt the user to enter a binary number
    let userInput: string | null = prompt("Enter a binary number:");

    // Check if the user input is not null
    if (userInput !== null) {
        // Convert the binary number to decimal
        let decimalResult: number = binaryToDecimal(userInput);

        // Display the decimal result to the user
        alert("The decimal equivalent is: " + decimalResult);
    }
}

// Call the function to get user input and convert it to decimal
getUserInputAndConvert();

/**
 */