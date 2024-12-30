/**
 * This TypeScript program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It aims to provide a comprehensive understanding of how hexadecimal numbers can be processed and converted.
 * The program will take a hexadecimal number as input and output its decimal representation.
 * This is a great exercise for programmers to practice their TypeScript skills and understand number systems.
 */

// Function to convert a single hexadecimal digit to its decimal equivalent
function hexDigitToDecimal(digit: string): number {
    // Define a mapping of hexadecimal digits to their decimal values
    const hexMap: { [key: string]: number } = {
        '0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9,
        'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15
    };
    // Convert the digit to uppercase to handle lowercase inputs
    digit = digit.toUpperCase();
    // Return the corresponding decimal value from the map
    return hexMap[digit];
}

// Function to convert a hexadecimal string to its decimal equivalent
function hexToDecimal(hex: string): number {
    // Initialize the decimal result to 0
    let decimalResult = 0;
    // Initialize a variable to keep track of the current power of 16
    let powerOf16 = 1;
    // Loop through the hexadecimal string from right to left
    for (let i = hex.length - 1; i >= 0; i--) {
        // Get the current hexadecimal digit
        const currentDigit = hex[i];
        // Convert the current hexadecimal digit to its decimal equivalent
        const decimalValue = hexDigitToDecimal(currentDigit);
        // Add the decimal value multiplied by the current power of 16 to the result
        decimalResult += decimalValue * powerOf16;
        // Update the power of 16 for the next iteration
        powerOf16 *= 16;
    }
    // Return the final decimal result
    return decimalResult;
}

// Function to prompt the user for a hexadecimal number and display the decimal result
function promptUserForHex() {
    // Prompt the user for a hexadecimal number
    const userInput = prompt("Enter a hexadecimal number:");
    // Check if the user provided an input
    if (userInput !== null) {
        // Convert the user input to its decimal equivalent
        const decimalResult = hexToDecimal(userInput);
        // Display the decimal result to the user
        alert(`The decimal equivalent of ${userInput} is ${decimalResult}`);
    }
}

// Call the function to prompt the user for a hexadecimal number
promptUserForHex();

/***
***/