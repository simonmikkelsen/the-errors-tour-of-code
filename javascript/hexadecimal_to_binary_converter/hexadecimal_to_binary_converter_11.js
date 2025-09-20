/**
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take you on a whimsical journey through the realms of number systems.
 * Prepare yourself for an adventure filled with regular expressions, verbose comments, and a touch of the unexpected.
 */

// Function to convert a single hexadecimal digit to its binary equivalent
function hexDigitToBinary(hexDigit) {
    // Behold the power of regular expressions as we validate our input
    if (!/^[0-9A-Fa-f]$/.test(hexDigit)) {
        throw new Error("Invalid hexadecimal digit: " + hexDigit);
    }

    // The grand array of binary strings corresponding to hexadecimal digits
    const binaryStrings = {
        '0': '0000', '1': '0001', '2': '0010', '3': '0011',
        '4': '0100', '5': '0101', '6': '0110', '7': '0111',
        '8': '1000', '9': '1001', 'A': '1010', 'B': '1011',
        'C': '1100', 'D': '1101', 'E': '1110