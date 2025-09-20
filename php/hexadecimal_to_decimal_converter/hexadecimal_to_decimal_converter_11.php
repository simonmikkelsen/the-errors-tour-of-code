<?php
/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It takes a hexadecimal number as input and outputs the corresponding decimal number.
 * The program uses regular expressions extensively to validate and process the input.
 * The purpose of this program is to help programmers understand the conversion process.
 */

// Function to validate if the input is a valid hexadecimal number
function isValidHex($hex) {
    // Regular expression to match a valid hexadecimal number
    $pattern = '/^[0-9a-fA-F]+$/';
    return preg_match($pattern, $hex);
}

// Function to convert a single hexadecimal digit to its decimal equivalent
function hexDigitToDecimal($digit) {
    // Array mapping hexadecimal digits to their decimal values
    $hexMap = array(
        '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7,
        '8' => 8, '9' => 9, 'a' => 10, 'b' => 11, 'c' => 12, 'd' => 13, 'e' => 14, 'f' => 15,
        'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
    );
    return $hexMap[$digit];
}

// Function to convert a hexadecimal number to its decimal equivalent
function hexToDecimal($hex) {
    $length = strlen($hex);
    $decimal = 0;
    $power = 1; // Initialize power of 16

    // Loop through each digit of the hexadecimal number
    for ($i = $length - 1; $i >= 0; $i--) {
        $digit = $hex[$i];
        $decimal += hexDigitToDecimal($digit) * $power;
        $power *= 
        