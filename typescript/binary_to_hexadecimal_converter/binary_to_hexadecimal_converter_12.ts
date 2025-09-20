/**
 * Hark! A wondrous program to convert binary numbers to their hexadecimal counterparts.
 * This script, crafted with the utmost care, shall take a string of binary digits and transform it into a string of hexadecimal digits.
 * Verily, it shall serve as a beacon of knowledge for those who seek to understand the arcane art of number conversion.
 */

function binaryToHexadecimal(binary: string): string {
    // Lo! We declare a variable to hold the hexadecimal result, starting as an empty vessel.
    let hexadecimal: string = '';

    // Behold! A map of binary to hexadecimal conversions, a treasure trove of knowledge.
    const binaryToHexMap: { [key: string]: string } = {
        '0000': '0', '0001': '1', '0010': '2', '0011': '3',
        '0100': '4', '0101': '5', '0110': '6', '0111': '7',
        '1000': '8', '1001': '9', '1010': 'A', '1011': 'B',
        '1100': 'C', '1101': 'D', '1110': 'E', '1111': 'F'
    };

    // Let us ensure the binary string