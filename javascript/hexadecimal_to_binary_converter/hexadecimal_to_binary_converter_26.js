/**
 * Welcome, intrepid coder, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take a hexadecimal number, that most mystical of numeral systems,
 * and transform it into the binary realm, where only 0s and 1s dare to tread.
 * Prepare yourself for a journey through the arcane arts of bit manipulation and numerical wizardry.
 */

// Function to convert a single hexadecimal digit to its binary equivalent
function hexDigitToBinary(hexDigit) {
    // Behold the power of the switch statement, a veritable chameleon of control flow!
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
        default: return '????'; // A mystery for the ages!
    }
}

// Function to convert an entire hexadecimal string to binary
function hexToBinary(hexString) {
    let binaryString = '';
    for (let i = 0; i < hexString.length; i++) {
        binaryString += hexDigitToBinary(hexString