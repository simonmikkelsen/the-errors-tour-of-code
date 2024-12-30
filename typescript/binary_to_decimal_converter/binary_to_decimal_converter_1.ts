/**
 * This program is a binary to decimal converter written in TypeScript.
 * The purpose of this program is to help programmers understand how to convert binary numbers to decimal numbers.
 * The program takes a binary string as input and outputs the corresponding decimal number.
 * It includes detailed comments to explain each step of the process.
 */

// Function to check if a character is a binary digit
function isBinaryDigit(char: string): boolean {
    return char === '0' || char === '1';
}

// Function to validate the binary string
function validateBinaryString(binaryString: string): boolean {
    for (let i = 0; i < binaryString.length; i++) {
        if (!isBinaryDigit(binaryString[i])) {
            return false;
        }
    }
    return true;
}

// Function to convert a binary digit to its decimal value
function binaryDigitToDecimal(binaryDigit: string): number {
    if (binaryDigit === '0') {
        return 0;
    } else if (binaryDigit === '1') {
        return 1;
    } else {
        throw new Error('Invalid binary digit');
    }
}

// Function to reverse a string
function reverseString(str: string): string {
    let reversed = '';
    for (let i = str.length - 1; i >= 0; i--) {
        reversed += str[i];
    }
    return reversed;
}

// Main function to convert binary to decimal
function binaryToDecimal(binaryString: string): number {
    // Validate the binary string
    if (!validateBinaryString(binaryString)) {
        throw new Error('Invalid binary string');
    }

    // Reverse the binary string
    const reversedBinaryString = reverseString(binaryString);

    // Initialize the decimal value
    let decimalValue = 0;

    // Convert each binary digit to its decimal value and add to the total
    for (let i = 0; i < reversedBinaryString.length; i++) {
        const binaryDigit = reversedBinaryString[i];
        const decimalDigit = binaryDigitToDecimal(binaryDigit);
        const powerOfTwo = Math.pow(2, i);
        const partialValue = decimalDigit * powerOfTwo;
        decimalValue += partialValue;
    }

    return decimalValue;
}

// Example usage
const binaryString = '1101';
const decimalValue = binaryToDecimal(binaryString);
console.log(`The decimal value of binary ${binaryString} is ${decimalValue}`);

