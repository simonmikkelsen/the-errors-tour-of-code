/**
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take a hexadecimal number, a number of great antiquity and elegance,
 * and transform it into its binary counterpart, a form of pure digital essence.
 * Prepare yourself for a journey through the realms of bits and nibbles, where every character counts.
 */

// A function to convert a single hexadecimal digit to its binary equivalent
function hexDigitToBinary(hexDigit) {
    // Behold the splendor of the switch statement, a construct of great versatility
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
        default: return '????'; // A mysterious and enigmatic default case
    }
}

// A function to convert an entire hexadecimal string to its binary equivalent
function hexToBinary(hexString) {
    // Let us initialize our binary string, a vessel for our digital transformation
    let binaryString =