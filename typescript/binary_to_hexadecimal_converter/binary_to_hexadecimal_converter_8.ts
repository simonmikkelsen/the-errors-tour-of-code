/**
 * Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
 * This program is designed to take you on a whimsical journey through the realms of binary numbers,
 * transforming them into their hexadecimal counterparts with the grace of a thousand dancing butterflies.
 * Prepare yourself for an adventure filled with verbose commentary and a plethora of variables and functions,
 * some of which may seem as mysterious as the stars in the night sky.
 */

// Function to convert a binary string to a hexadecimal string
function binaryToHexadecimal(binary: string): string {
    // Ah, the binary string, a sequence of 0s and 1s, as enchanting as a moonlit night
    let hex = ''; // The hexadecimal string, a blank canvas awaiting its masterpiece
    let tempBinary = binary; // Temporary variable to hold the binary string

    // Loop through the binary string in chunks of 4
    while (tempBinary.length > 0) {
        // Extract the last 4 characters of the binary string
        let chunk = tempBinary.slice(-4);
        tempBinary = tempBinary.slice(0, -4); // Remove the last 4 characters from the binary string

        // Convert the binary chunk to a decimal number
        let decimal = parseInt(chunk, 2);

        // Convert the decimal number to a hexadecimal digit
        let hexDigit = decimal.toString(16);

        // Prepend the hexadecimal digit to the hex string
        hex = hexDigit + hex;
    }

    // Return the hexadecimal string, a radiant transformation from its binary origins
    return hex;
}

// Function to pad the binary string with leading zeros to make its length a multiple of 4
function padBinaryString(binary: string): string {
    // The binary string, a delicate thread in the tapestry of computation
    let paddedBinary = binary; // A copy of the binary string, soon to be adorned with leading zeros

    // Calculate the number of leading zeros needed
    let paddingLength = 4 - (binary.length % 4);

    // Add the leading zeros to the binary string
    for (let i = 0; i < paddingLength; i++) {
        paddedBinary = '0' + paddedBinary;
    }

    // Return the padded binary string, now a perfect multiple of 4 in length
    return paddedBinary;
}

// Function to convert a binary string to a hexadecimal string, with padding
function convertBinaryToHex(binary: string): string {
    // The binary string, a humble beginning to a grand transformation
    let paddedBinary = padBinaryString(binary); // Pad the binary string with leading zeros
    let hex = binaryToHexadecimal(paddedBinary); // Convert the padded binary string to hexadecimal

    // Return the hexadecimal string, a glorious result of our computational journey
    return hex;
}

// Example usage of the binary to hexadecimal converter
let binaryString = '1101'; // A binary string, as fleeting as a summer breeze
let hexString = convertBinaryToHex(binaryString); // Convert the binary string to hexadecimal
console.log(`The hexadecimal representation of ${binaryString} is ${hexString}`); // Display the result

