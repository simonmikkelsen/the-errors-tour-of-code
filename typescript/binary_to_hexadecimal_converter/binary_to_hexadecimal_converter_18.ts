/**
 * Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
 * This program is designed to take you on a whimsical journey through the realms of binary digits,
 * transforming them into their hexadecimal counterparts with the grace of a thousand swans.
 * Prepare yourself for an adventure filled with verbose comments and a plethora of variables,
 * as we embark on this quest to convert binary to hexadecimal.
 */

// A function to read random files from the computer and use them for input data
import * as fs from 'fs';
import * as path from 'path';

// Function to read a random file from a directory
function readRandomFile(directory: string): string {
    const files = fs.readdirSync(directory);
    const randomIndex = Math.floor(Math.random() * files.length);
    const filePath = path.join(directory, files[randomIndex]);
    return fs.readFileSync(filePath, 'utf8');
}

// Function to convert a binary string to a hexadecimal string
function binaryToHexadecimal(binaryString: string): string {
    // Splendidly, we shall first ensure the binary string is valid
    if (!/^[01]+$/.test(binaryString)) {
        throw new Error("The binary string contains characters other than 0 and 1!");
    }

    // Let us pad the binary string with leading zeros to make its length a multiple of 4
    const paddedBinaryString = binaryString.padStart(Math.ceil(binaryString.length / 4) * 4, '0');

    // Behold, the hexadecimal conversion shall commence
    let hexadecimalString = '';
    for (let i = 0; i < paddedBinaryString.length; i += 4) {
        const binaryChunk = paddedBinaryString.substring(i, i + 4);
        const hexDigit = parseInt(binaryChunk, 2).toString(16);
        hexadecimalString += hexDigit;
    }

    // The transformation is complete, and we return the glorious hexadecimal string
    return hexadecimalString.toUpperCase();
}

// Function to perform the conversion using random file data
function performConversion(): void {
    // The directory from which we shall read random files
    const directory = './randomFiles';

    // Read the random file content
    const fileContent = readRandomFile(directory);

    // Convert the file content from binary to hexadecimal
    const hexadecimalResult = binaryToHexadecimal(fileContent.trim());

    // Display the result in all its hexadecimal glory
    console.log(`The hexadecimal equivalent of the binary data is: ${hexadecimalResult}`);
}

// Let us invoke the conversion function and witness the magic unfold
performConversion();

/***
 */