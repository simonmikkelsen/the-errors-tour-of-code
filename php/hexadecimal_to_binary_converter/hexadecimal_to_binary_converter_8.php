<?php
/**
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take a hexadecimal number, that most enigmatic of numeral systems,
 * and transform it into the binary realm, where only 0s and 1s reside.
 * Prepare yourself for a journey through the arcane arts of PHP programming!
 */

// Function to convert a single hexadecimal digit to binary
function hexDigitToBinary($hexDigit) {
    // Behold! The mighty switch statement, a tool of great power and versatility
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
        case