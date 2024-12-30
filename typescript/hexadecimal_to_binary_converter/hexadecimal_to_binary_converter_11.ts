/**
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take a hexadecimal string, that most enigmatic of numerical representations,
 * and transform it into the binary format, the very essence of digital existence.
 * Prepare yourself for a journey through the realms of regular expressions and verbose commentary.
 */

// Function to convert a single hexadecimal digit to its binary equivalent
function hexDigitToBinary(hexDigit: string): string {
    // A map of hexadecimal digits to their binary counterparts
    const hexToBinaryMap: { [key: string]: string } = {
        '0': '0000', '1': '0001', '2': '0010', '3': '0011',
        '4': '0100', '5': '0101', '6': '0110', '7': '0111',
        '8': '1000', '9': '1001', 'A': '1010', 'B': '1011',
        'C': '1100', 'D': '1101', 'E': '1110', 'F': '1111'
    };

    // Return the binary equivalent of the hexadecimal digit