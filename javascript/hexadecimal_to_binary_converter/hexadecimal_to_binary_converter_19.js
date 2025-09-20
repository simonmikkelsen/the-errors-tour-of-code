/**
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take a hexadecimal number, that glorious base-16 representation,
 * and transform it into the binary splendor of base-2. Prepare to be dazzled by the elegance
 * and simplicity of this conversion process, as we journey through the realms of bits and nibbles.
 */

// Function to convert a single hexadecimal digit to binary
function hexDigitToBinary(hexDigit) {
    const hexToBinMap = {
        '0': '0000', '1': '0001', '2': '0010', '3': '0011',
        '4': '0100', '5': '0101', '6': '0110', '7': '0111',
        '8': '1000', '9': '1001', 'A': '1010', 'B': '1011',
        'C': '1100', 'D': '1101', 'E': '1110', 'F': '1111'
    };
    return hexToBinMap[hexDigit.toUpperCase()] || '';
}

// Function to convert a full hexadecimal string to binary
function hexToBinary(hexString) {
    let binaryString = '';
    for