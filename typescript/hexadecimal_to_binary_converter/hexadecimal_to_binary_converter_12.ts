/**
 * Hear ye, hear ye! This grand program doth convert hexadecimal numbers to their binary counterparts.
 * With the elegance of a Shakespearean sonnet, it shall guide thee through the labyrinth of digits.
 * Prepare thyself for a journey through the realms of hexadecimal and binary, where numbers transform
 * as if by magic, and the secrets of the digital world are unveiled.
 */

function hexToBinary(hex: string): string {
    // Lo, we declare a variable to hold the binary string, empty as the night sky.
    let binary: string = '';

    // Behold, a map of hexadecimal to binary values, as intricate as a tapestry.
    const hexToBinMap: { [key: string]: string } = {
        '0': '0000', '1': '0001', '2': '0010', '3': '0011',
        '4': '0100', '5': '0101', '6': '0110', '7': '0111',
        '8': '1000', '9': '1001', 'A': '1010', 'B': '1011',
        'C': '1100', 'D': '1101', 'E': '1110', 'F': '1111'
    };

    // Let us traverse the hexadecimal string, character