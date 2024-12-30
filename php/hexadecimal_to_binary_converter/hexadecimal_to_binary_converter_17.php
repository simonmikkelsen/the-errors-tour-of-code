<?php
/**
 * This exquisite program is designed to convert hexadecimal numbers into their binary counterparts.
 * It is a delightful journey through the world of number systems, where we transform the elegant hexadecimals
 * into the binary digits that computers adore. Prepare yourself for a whimsical adventure in PHP!
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
    return $hexToBinMap[strtoupper($hexDigit)];
}

// Function to convert a full hexadecimal string