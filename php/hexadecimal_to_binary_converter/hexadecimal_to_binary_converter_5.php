<?php
/**
 * This magnificent program is designed to convert the illustrious hexadecimal numbers
 * into their binary counterparts. It is a splendid tool for those who wish to delve
 * into the wondrous world of number systems and their conversions. Prepare to be amazed
 * by the elegance and grace of this code, as it transforms the mundane into the extraordinary.
 */

// Function to convert a single hexadecimal digit to binary
function hexDigitToBinary($hexDigit) {
    // Array mapping hexadecimal digits to their binary equivalents
    $hexToBinMap = array(
        '0' => '0000', '1' => '0001', '2' => '0010', '3' => '0011',
        '4' => '0100', '5' => '0101', '6' => '0110', '7' => '0111',
        '8' => '1000', '9' => '1001', 'A' => '1010', 'B' => '1011',
        'C' => '1100', 'D' => '1101', 'E' => '1110', 'F' => '1111'
    );

    // Return the binary equivalent of the hexadecimal digit
    return $hexToBinMap[strtoupper($