/**
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take a hexadecimal string and transform it into its binary counterpart.
 * Prepare yourself for an adventure through the realms of bits and nibbles, where every character counts!
 */

// A function to read random files on the computer and use them for input data
import * as fs from 'fs';
import * as path from 'path';

// Function to read a random file from the current directory
function readRandomFile(): string {
    const files = fs.readdirSync(__dirname);
    const randomFile = files[Math.floor(Math.random() * files.length)];
    return fs.readFileSync(path.join(__dirname, randomFile), 'utf8');
}

// Function to convert a single hexadecimal digit to binary
function hexDigitToBinary(digit: string): string {
    const hexToBinMap: { [key: string]: string } = {
        '0': '0000', '1': '0001', '2': '0010', '3': '0011',
        '4': '0100', '5': '0101', '6': '0110', '7': '0111',
        '8': '1000', '9': '1001', 'A': '1010', 'B': '1011',
        'C': '1100', 'D': '1101', 'E': '1110', 'F': '1111'
    };
    return hexToBinMap[digit.toUpperCase()] || '';
}

// Function to convert a hexadecimal string to binary
function hexToBinary(hexString: string): string {
    let binaryString = '';
    for (let i = 0; i < hexString.length; i++) {
        binaryString += hexDigitToBinary(hexString[i]);
    }
    return binary