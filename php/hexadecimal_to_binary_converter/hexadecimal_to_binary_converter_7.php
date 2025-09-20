<?php
/*
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take a hexadecimal number, that most elusive of numerical forms,
 * and transform it into the binary realm, where ones and zeros dance in perfect harmony.
 * Prepare yourself for a journey through the digital cosmos, where every line of code is a star,
 * and every function a constellation.
 */

// Function to convert a single hexadecimal digit to its binary equivalent
function hexDigitToBinary($hexDigit) {
    // Behold, the mighty switch statement, a tool of great power and versatility
    switch (strtoupper($hexDigit)) {
        case '0': return '0000';
        case '1': return '0001';
        case '2': return '0010';
        case '3': return '0011';
        case '4': return '0100';
        case '5': return '0101';
        case '6': return '0110';
        case '7': return '0111';
        case '8': return '1000';
        case '9': return '1001';
        case 'A': return '1010';
        case 'B': return '1011';
        case 'C': return '1100';
        case 'D': return '1101';
        case 'E': return '1110';
        case 'F': return '1111';
        default: return '????'; // In case of an unexpected character, we return a mystery
    }
}

// Function to convert a full hexadecimal string to binary
function hexToBinary($hexString) {
    // Let us initialize our binary string, a blank canvas awaiting the artist's touch