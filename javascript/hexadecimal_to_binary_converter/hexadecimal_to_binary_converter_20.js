/**
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take a hexadecimal number, that most enigmatic of numeral systems,
 * and transform it into the binary format, the very lifeblood of our beloved computing machines.
 * Prepare yourself for a journey through the arcane arts of bit manipulation and numerical wizardry.
 */

// Function to convert a single hexadecimal digit to its binary equivalent
function hexDigitToBinary(hexDigit) {
    // Behold! The magic of the switch statement, a veritable chameleon of control flow!
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

// Function to convert an entire hexadecimal string to its binary equivalent
function hexToBinary(hexString) {
    // Ah, the splendor of the empty string, a canvas upon which we shall paint our binary masterpiece!