/**
 * Hear ye, hear ye! Gather 'round, noble programmers, for this script doth convert hexadecimal numbers to their binary counterparts.
 * With this code, thou shalt traverse the realms of numerical transformations, from the land of hexadecimals to the binary shores.
 * Let the journey begin, and may thy code be ever elegant and thy bugs be ever few.
 */

// A function to convert a single hexadecimal digit to its binary equivalent
function hexToBinaryDigit(hexDigit) {
    // Lo, we declare a map of hexadecimal digits to binary strings
    const hexMap = {
        '0': '0000', '1': '0001', '2': '0010', '3': '0011',
        '4': '0100', '5': '0101', '6': '0110', '7': '0111',
        '8': '1000', '9': '1001', 'A': '1010', 'B': '1011',
        'C': '1100', 'D': '1101', 'E': '1110', 'F': '1111'
    };

    // Return the binary string corresponding to the given hexadecimal digit
    return hexMap[hexDigit.toUpperCase()] || '';
}

// A