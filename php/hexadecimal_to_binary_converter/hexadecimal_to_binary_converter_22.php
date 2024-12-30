<?php
/**
 * Hexadecimal to Binary Converter
 * 
 * This program is a delightful journey into the world of number systems.
 * It takes a hexadecimal number, a marvel of human ingenuity, and converts it into its binary counterpart,
 * a fundamental building block of the digital universe. 
 * 
 * The program is designed to be verbose and colorful, with a plethora of variables and functions
 * that add to the richness of the code. Enjoy the ride through this whimsical codebase!
 */

// Function to convert a single hexadecimal digit to binary
function hexDigitToBinary($hexDigit) {
    // Array mapping hexadecimal digits to their binary equivalents
    $hexToBinMap = array(
        '0' => '0000', '1' => '0001', '2' => '0010', '3' => '0011',
        '4' => '0100', '5' => '0101', '6' => '0110', '7' => '0111',
        '8' => '1000', '9' => '1001', 'A' => '1010', 'B' => '1011',
        'C' => '1100', 'D' => '1101', 'E' => '1110', 'F' => '111