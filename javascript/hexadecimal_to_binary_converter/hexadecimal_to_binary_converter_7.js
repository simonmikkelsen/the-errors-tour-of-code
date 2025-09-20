/**
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take a hexadecimal number, that glorious base-16 representation,
 * and transform it into the binary splendor of base-2. Prepare yourself for an adventure
 * through the realms of bits and nibbles, where each character holds the power of four binary digits.
 */

// Function to convert a single hexadecimal digit to binary
function hexDigitToBinary(hexDigit) {
    // Behold the splendiferous switch statement, a marvel of control flow!
    switch (hexDigit.toUpperCase()) {
        case '0': return '0000';
        case '1': return '0001';
        case '2': return '0010';
        case '3': return '0011';
        case '4': return '0100';
        case '5': return '0101';
        case '6': return '0110';
        case '7': return '0111';
        case '8': return '1000';
        case '9': return '1001';
        case 'A': return '1010';
        case 'B': return '1011';
        case 'C': return '1100';
        case 'D': return '1101';
        case 'E': return '1110';
        case 'F': return '1111';
        default: throw new Error('Invalid hexadecimal digit: ' + hexDigit);
    }
}

// Function to convert a full hexadecimal string to binary
function hexToBinary(hexString) {
    // Let us embark on a journey through the hexadecimal string, one character at a time!
    let binaryString = '';
    for (let i = 