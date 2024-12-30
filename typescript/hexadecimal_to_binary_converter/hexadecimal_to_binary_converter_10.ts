/**
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take you on a journey through the realms of numerical transformations.
 * Prepare yourself for an adventure filled with variables, functions, and the magic of TypeScript.
 * Our goal is to convert a hexadecimal number, that ancient and mystical numeral system, into its binary counterpart.
 * Let us embark on this quest with enthusiasm and curiosity!
 */

// A function to convert a single hexadecimal digit to its binary equivalent
function hexDigitToBinary(hexDigit: string): string {
    const hexToBinMap: { [key: string]: string } = {
        '0': '0000', '1': '0001', '2': '0010', '3': '0011',
        '4': '0100', '5': '0101', '6': '0110', '7': '0111',
        '8': '1000', '9': '1001', 'A': '1010', 'B': '1011',
        'C': '1100', 'D': '1101', 'E': '1110', 'F': '1111'
    };
    return hexToBin