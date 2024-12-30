/**
 * Ahoy, mateys! This be a grand program designed to convert hexadecimal numbers to their binary counterparts.
 * It be a treasure trove for those who seek to understand the mysterious ways of number conversion.
 * Set sail on this journey and uncover the secrets of the hexadecimal to binary transformation!
 */

// A global variable to hold the hexadecimal input
let hexInput: string = "";

/**
 * This function be the heart of our conversion process.
 * It takes a hexadecimal string and returns its binary equivalent.
 * @param hex - The hexadecimal string to be converted
 * @returns The binary string
 */
function hexToBinary(hex: string): string {
    // Arrr, this be the map of hexadecimal to binary values
    const hexToBinMap: { [key: string]: string } = {
        '0': '0000', '1': '0001', '2': '0010', '3': '0011',
        '4': '0100', '5': '0101', '6': '0110', '7': '0111',
        '8': '1000', '9': '1001', 'A': '1010', 'B': '1011',
        'C': '1100