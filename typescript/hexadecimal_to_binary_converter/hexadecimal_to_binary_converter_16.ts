/**
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take a hexadecimal number, that most enigmatic of numeral systems,
 * and transform it into the binary format, the very language of computers themselves.
 * Prepare yourself for a journey through the arcane arts of bit manipulation and numerical wizardry.
 */

// A function to convert a single hexadecimal digit to its binary equivalent
function hexDigitToBinary(digit: string): string {
    // A dictionary to map hexadecimal digits to their binary counterparts
    const hexToBinMap: { [key: string]: string } = {
        '0': '0000', '1': '0001', '2': '0010', '3': '0011',
        '4': '0100', '5': '0101', '6': '0110', '7': '0111',
        '8': '1000', '9': '1001', 'A': '1010', 'B': '1011',
        'C': '1100', 'D': '1101', 'E': '1110', 'F': '1111'
    };

    // Return the binary equivalent of the hexadecimal digit
    return hexToBinMap[digit