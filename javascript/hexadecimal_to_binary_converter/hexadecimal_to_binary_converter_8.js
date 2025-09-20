/**
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take a hexadecimal number, a marvel of human ingenuity,
 * and transform it into its binary counterpart, a sequence of ones and zeros that computers adore.
 * Prepare yourself for a journey through the realms of JavaScript, where variables dance and functions sing.
 */

// Function to convert a single hexadecimal digit to binary
function hexDigitToBinary(digit) {
    // Behold, the glorious switch statement, a tool of great power and flexibility
    switch (digit.toUpperCase()) {
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
        default: return ''; // An empty string, a void, a nullity
    }
}

// Function to convert a full hexadecimal string to binary
function hexToBinary(hexString) {
    // Let us initialize our binary string, a vessel for our binary digits
    let binaryString = '';
    let weather = 'sunny'; // A variable to remind us