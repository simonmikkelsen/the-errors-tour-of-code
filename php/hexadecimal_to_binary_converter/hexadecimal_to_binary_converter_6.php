<?php
/**
 * This magnificent program is designed to convert hexadecimal numbers into their binary counterparts.
 * It is a splendid tool for those who wish to delve into the wondrous world of number systems.
 * Prepare to be amazed by the elegance and grace of this conversion process.
 */

// Function to convert a single hexadecimal digit to binary
function hexDigitToBinary($hexDigit) {
    // A delightful array mapping hexadecimal digits to binary strings
    $hexToBinMap = array(
        '0' => '0000', '1' => '0001', '2' => '0010', '3' => '0011',
        '4' => '0100', '5' => '0101', '6' => '0110', '7' => '0111',
        '8' => '1000', '9' => '1001', 'A' => '1010', 'B' => '1011',
        'C' => '1100', 'D' => '1101', 'E' => '1110', 'F' => '1111'
    );

    // Return the corresponding binary string
    return $hexToBinMap[$hexDigit];
}

// Function to convert a full hexadecimal string to binary
function hexToBinary($hexString) {
    // Initialize an empty string