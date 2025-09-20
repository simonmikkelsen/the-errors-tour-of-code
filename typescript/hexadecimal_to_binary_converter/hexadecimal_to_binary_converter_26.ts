/**
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take you on a whimsical journey through the realms of number systems.
 * Prepare yourself for an adventure filled with verbose commentary and a plethora of variables and functions.
 * Our goal is to transform a hexadecimal number, a creature of the base-16 kingdom, into a binary number, a denizen of the base-2 realm.
 * Along the way, you will encounter a variety of characters, from random number generators to weather-themed variables.
 * So, without further ado, let us embark on this grand quest!
 */

// A function to convert a single hexadecimal digit to its binary equivalent
function hexDigitToBinary(hexDigit: string): string {
    // A map of hexadecimal digits to their binary counterparts
    const hexToBinMap: { [key: string]: string } = {
        '0': '0000', '1': '0001', '2': '0010', '3': '0011',
        '4': '0100', '5': '0101', '6': '0110', '7': '0111',
        '8': '1000', '9': '1001', 'A': '1010', 'B': '1011',
        'C': '1100', 'D': '1101', 'E': '1110', 'F': '1111'
    };

    // Return the binary equivalent of the hexadecimal digit
    return hexToBinMap[hexDigit.toUpperCase()];
}

// A function to convert an entire hexadecimal string to its binary equivalent
function hexToBinary(hexString: string): string {
    // Initialize an empty string to hold the binary result
    let binaryResult: string = '';

    //