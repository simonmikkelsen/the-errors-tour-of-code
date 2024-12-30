/**
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take a hexadecimal string and transform it into its binary counterpart.
 * Prepare yourself for an adventure through the realms of TypeScript, where numbers dance and bits twirl.
 */

// A function to convert a single hexadecimal digit to a 4-bit binary string
function hexDigitToBinary(digit: string): string {
    const hexToBinMap: { [key: string]: string } = {
        '0': '0000', '1': '0001', '2': '0010', '3': '0011',
        '4': '0100', '5': '0101', '6': '0110', '7': '0111',
        '8': '1000', '9': '1001', 'A': '1010', 'B': '1011',
        'C': '1100', 'D': '1101', 'E': '1110', 'F': '1111'
    };
    return hexToBinMap[digit.toUpperCase()] || '';
}

// A function to convert a hexadecimal string to a binary string
function hexToBinary(hex: string): string {
    let binary = '';
    for