/**
 * Welcome to the magnificent Binary to Hexadecimal Converter!
 * This program is designed to take a binary number, a series of 0s and 1s,
 * and transform it into its hexadecimal counterpart, a dazzling display of 0-9 and A-F.
 * Prepare to be amazed by the elegance and grace of this conversion process.
 */

// A function to convert a binary string to a decimal number
function binaryToDecimal(binary: string): number {
    let decimal = 0;
    let length = binary.length;
    for (let i = 0; i < length; i++) {
        if (binary[length - 1 - i] === '1') {
            decimal += Math.pow(2, i);
        }
    }
    return decimal;
}

// A function to convert a decimal number to a hexadecimal string
function decimalToHexadecimal(decimal: number): string {
    let hex = '';
    const hexCharacters = '0123456789ABCDEF';
    while (decimal > 0) {
        hex = hexCharacters[decimal % 16] + hex;
        decimal = Math.floor(decimal / 16);
    }
    return hex || '0';
}

// A function to convert a binary string to a hexadecimal string
function binaryToHexadecimal(binary: string): string {
    const decimal = binaryToDecimal(binary);
    return decimalToHexadecimal(decimal);
}

// A function to get user input and display the result
function getUserInputAndConvert() {
    const userInput = prompt("Enter a binary number:");
    if (userInput) {
        const result = binaryToHexadecimal(userInput);
        alert(`The hexadecimal equivalent is: ${result}`);
    } else {
        alert("No input provided!");
    }
}

// Call the function to start the process
getUserInputAndConvert();

/***
 */