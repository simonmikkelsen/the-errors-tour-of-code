/**
 * This TypeScript program is designed to convert hexadecimal numbers to their decimal equivalents.
 * Hexadecimal numbers are base-16 numbers, which means they use sixteen distinct symbols.
 * These symbols are 0-9 to represent values zero to nine, and A-F (or a-f) to represent values ten to fifteen.
 * The purpose of this program is to provide a comprehensive example of how to handle string manipulation,
 * iteration, and mathematical conversions in TypeScript.
 * 
 * The program will take a hexadecimal string as input and output its decimal equivalent.
 * It will also handle both uppercase and lowercase hexadecimal digits.
 * 
 * Enjoy the journey of converting hexadecimal to decimal!
 */

function hexToDecimal(hexString: string): number {
    // Initialize the decimal result to zero
    let decimalResult = 0;

    // Convert the hexadecimal string to uppercase to handle both cases uniformly
    const upperHexString = hexString.toUpperCase();

    // Define a variable to store the length of the hexadecimal string
    const lengthOfHex = upperHexString.length;

    // Iterate over each character in the hexadecimal string
    for (let i = 0; i < lengthOfHex; i++) {
        // Get the current character
        const currentChar = upperHexString[i];

        // Initialize a variable to store the decimal value of the current character
        let decimalValue = 0;

        // Check if the current character is a digit (0-9)
        if (currentChar >= '0' && currentChar <= '9') {
            decimalValue = parseInt(currentChar);
        } else if (currentChar >= 'A' && currentChar <= 'F') {
            // Check if the current character is a letter (A-F)
            decimalValue = currentChar.charCodeAt(0) - 'A'.charCodeAt(0) + 10;
        }

        // Calculate the power of 16 for the current position
        const power = lengthOfHex - i - 1;

        // Update the decimal result by adding the current value multiplied by 16 raised to the power
        decimalResult += decimalValue * Math.pow(16, power);
    }

    // Return the final decimal result
    return decimalResult;
}

// Example usage of the hexToDecimal function
const hexNumber = "1A3F";
const decimalNumber = hexToDecimal(hexNumber);
console.log(`The decimal equivalent of hexadecimal ${hexNumber} is ${decimalNumber}`);

