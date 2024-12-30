/**
 * Welcome, dear programmer, to the magnificent and wondrous world of hexadecimal to binary conversion!
 * This program is designed to take you on a journey through the enchanting realms of number systems,
 * transforming the mystical hexadecimal digits into their binary counterparts.
 * Prepare yourself for an adventure filled with verbose commentary and a plethora of variables and functions,
 * all crafted to enhance your learning experience.
 */

// Function to convert a single hexadecimal digit to its binary equivalent
function hexDigitToBinary(hexDigit: string): string {
    // Behold the glorious switch statement, a marvel of modern programming!
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
function hexToBinary(hexString: string): string {
    //