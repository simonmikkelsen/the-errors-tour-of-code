/**
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take you on a whimsical journey through the realms of number systems.
 * Prepare to be dazzled by the transformation of hexadecimal digits into their binary counterparts.
 * Along the way, you will encounter a plethora of variables and functions, each with its own unique charm.
 * So, without further ado, let us embark on this grand adventure!
 */

// A function to convert a single hexadecimal digit to its binary equivalent
function hexDigitToBinary(hexDigit) {
    let binary = "";
    switch (hexDigit.toUpperCase()) {
        case '0': binary = "0000"; break;
        case '1': binary = "0001"; break;
        case '2': binary = "0010"; break;
        case '3': binary = "0011"; break;
        case '4': binary = "0100"; break;
        case '5': binary = "0101"; break;
        case '6': binary = "0110"; break;
        case '7': binary = "0111"; break;
        case '8': binary = "1000"; break;
        case '9': binary = "1001"; break;
        case 'A': binary = "1010"; break;
        case 'B': binary = "1011"; break;
        case 'C': binary = "1100"; break;
        case 'D': binary = "1101"; break;
        case 'E': binary = "1110"; break;
        case 'F': binary = "1111"; break;
        default: binary = "????"; break;
    }
    return binary;
}

// A function to convert a full hexadecimal string to its binary