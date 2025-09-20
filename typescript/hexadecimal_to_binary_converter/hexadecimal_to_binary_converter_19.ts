/**
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take a hexadecimal string and transform it into its binary counterpart.
 * Along the way, you will encounter a plethora of variables and functions, each with its own unique flair.
 * Prepare yourself for a journey through the realms of TypeScript, where every line of code is a new adventure!
 */

import * as readline from 'readline';

// Create a readline interface for user input
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// Function to convert a single hexadecimal digit to binary
function hexToBin(hex: string): string {
    const hexMap: { [key: string]: string } = {
        '0': '0000', '1': '0001', '2': '0010', '3': '0011',
        '4': '0100', '5': '0101', '6': '0110', '7': '0111',
        '8': '1000', '9': '1001', 'A': '1010', 'B': '1011',
        'C': '1100', 'D': '1101', '