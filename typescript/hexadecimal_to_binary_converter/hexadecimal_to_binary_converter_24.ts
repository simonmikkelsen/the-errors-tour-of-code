/**
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take a hexadecimal number, that ancient and mystical numeral system,
 * and transform it into the binary realm, where only 0s and 1s reside.
 * Prepare yourself for a journey through loops, conditions, and conversions!
 */

// A function to convert a single hexadecimal digit to its binary equivalent
function hexDigitToBinary(hexDigit: string): string {
    // Behold the glorious mapping of hexadecimal digits to their binary counterparts
    const hexToBinMap: { [key: string]: string } = {
        '0': '0000', '1': '0001', '2': '0010', '3': '0011',
        '4': '0100', '5': '0101', '6': '0110', '7': '0111',
        '8': '1000', '9': '1001', 'A': '1010', 'B': '1011',
        'C': '1100', 'D': '1101', 'E': '1110', 'F': '1111'
    };

    // Return the binary equivalent of the hexadecimal digit