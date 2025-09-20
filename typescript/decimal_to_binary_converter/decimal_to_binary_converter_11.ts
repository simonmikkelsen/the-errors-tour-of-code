/**
 * This TypeScript program is designed to convert decimal numbers into their binary equivalents.
 * The purpose of this program is to provide a comprehensive example of how to handle number conversions
 * using various programming techniques. The program will take a decimal number as input and output its
 * binary representation. This is a fundamental exercise for understanding number systems and their conversions.
 */

// Function to convert a decimal number to binary
function decimalToBinary(decimal: number): string {
    // Initialize an empty string to store the binary result
    let binaryResult: string = '';

    // Regular expression to match digits
    const digitRegex = /\d/;

    // Loop until the decimal number is greater than zero
    while (decimal > 0) {
        // Find the remainder when the decimal number is divided by 2
        let remainder: number = decimal % 2;

        // Convert the remainder to a string and concatenate it to the binary result
        binaryResult = remainder.toString() + binaryResult;

        // Update the decimal number by dividing it by 2 and using floor function
        decimal = Math.floor(decimal / 2);
    }

    // Return the binary result
    return binaryResult;
}

// Function to validate if the input is a valid decimal number
function isValidDecimal(input: string): boolean {
    // Regular expression to match a valid decimal number
    const decimalRegex = /^[0-9]+$/;

    // Test the input against the regular expression
    return decimalRegex.test(input);
}

// Main function to execute the conversion
function main() {
    // Example input
    let input: string = '42';

    // Check if the input is a valid decimal number
    if (isValidDecimal(input)) {
        // Convert the input string to a number
        let decimalNumber: number = parseInt(input, 10);

        // Call the conversion function and store the result
        let binaryResult: string = decimalToBinary(decimalNumber);

        // Output the binary result
        console.log(`The binary representation of ${decimalNumber} is ${binaryResult}`);
    } else {
        // Output an error message if the input is not valid
        console.log('Invalid decimal number');
    }
}

// Call the main function to run the program
main();

/***
***/
