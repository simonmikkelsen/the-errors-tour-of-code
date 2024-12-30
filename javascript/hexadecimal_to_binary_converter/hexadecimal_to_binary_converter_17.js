/**
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take a hexadecimal number, a number so grand and majestic,
 * and transform it into its binary counterpart, a series of 0s and 1s that dance in the digital realm.
 * Prepare yourself for an adventure through the realms of code, where variables abound and functions flourish.
 */

// Function to convert a single hexadecimal digit to its binary equivalent
function hexDigitToBinary(digit) {
    // Behold the splendor of the conversion table, mapping each hex digit to its binary form
    const conversionTable = {
        '0': '0000', '1': '0001', '2': '0010', '3': '0011',
        '4': '0100', '5': '0101', '6': '0110', '7': '0111',
        '8': '1000', '9': '1001', 'A': '1010', 'B': '1011',
        'C': '1100', 'D': '1101', 'E': '1110', 'F': '1111'
    };
    return conversionTable[digit.toUpperCase()] ||