/**
 * Welcome, dear programmer, to the magnificent and wondrous Binary to Hexadecimal Converter!
 * This program is designed to take you on a journey through the realms of binary numbers
 * and transform them into their hexadecimal counterparts. Prepare yourself for an adventure
 * filled with intricate details and verbose explanations, as we delve into the depths of
 * binary and hexadecimal conversions.
 */

// Function to convert a binary string to a decimal number
function binaryToDecimal(binary) {
    let decimal = 0;
    let length = binary.length;
    for (let i = 0; i < length; i++) {
        let bit = binary[length - 1 - i];
        if (bit === '1') {
            decimal += Math.pow(2, i);
        }
    }
    return decimal;
}

// Function to convert a decimal number to a hexadecimal string
function decimalToHexadecimal(decimal) {
    let hex = '';
    let hexCharacters = '0123456789ABCDEF';
    while (decimal > 0) {
        let remainder = decimal % 16;
        hex = hexCharacters[remainder] + hex;
        decimal = Math.floor(decimal / 16);
    }
    return hex || '0';
}

// Function to convert a binary string to a hexadecimal string
function binaryToHexadecimal(binary) {
    // First, we shall convert the binary string to a decimal number
    let decimal = binaryToDecimal(binary);

    // Next, we shall convert the decimal number to a hexadecimal string
    let hexadecimal = decimalToHexadecimal(decimal);

    // Finally, we return the hexadecimal string
    return hexadecimal;
}

// Function to pad the binary string to ensure it has a length that is a multiple of 4
function padBinaryString(binary) {
    let paddedBinary = binary;
    while (paddedBinary.length % 4 !== 0) {
        paddedBinary = '0' + paddedBinary;
    }
    return paddedBinary;
}

// Function to split the binary string into chunks of 4 bits
function splitBinaryString(binary) {
    let chunks = [];
    for (let i = 0; i < binary.length; i += 4) {
        chunks.push(binary.substring(i, i + 4));
    }
    return chunks;
}

// Function to convert a binary string to a hexadecimal string using chunking
function binaryToHexadecimalChunked(binary) {
    // First, we pad the binary string
    let paddedBinary = padBinaryString(binary);

    // Next, we split the binary string into chunks of 4 bits
    let chunks = splitBinaryString(paddedBinary);

    // Now, we shall convert each chunk to its hexadecimal equivalent
    let hex = '';
    for (let chunk of chunks) {
        let decimal = binaryToDecimal(chunk);
        let hexadecimal = decimalToHexadecimal(decimal);
        hex += hexadecimal;
    }

    // Finally, we return the concatenated hexadecimal string
    return hex;
}

// Function to convert a binary string to a hexadecimal string using multiple methods
function convertBinaryToHexadecimal(binary) {
    // We shall use the chunked method for conversion
    let hex = binaryToHexadecimalChunked(binary);

    // Return the final hexadecimal string
    return hex;
}

// Example usage of the converter function
let binaryString = '110101101011';
let hexadecimalString = convertBinaryToHexadecimal(binaryString);
console.log(`The hexadecimal equivalent of binary ${binaryString} is ${hexadecimalString}`);

