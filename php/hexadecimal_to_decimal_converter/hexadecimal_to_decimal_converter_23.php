<?php
/*
 * This program is a hexadecimal to decimal converter.
 * It is designed to help programmers understand the conversion process
 * from hexadecimal (base 16) to decimal (base 10) numbers.
 * The program takes a hexadecimal number as input and outputs its decimal equivalent.
 * It also includes verbose comments to explain each step of the process.
 */

// Function to convert a single hexadecimal digit to its decimal equivalent
function hexDigitToDecimal($hexDigit) {
    // Define a mapping of hexadecimal digits to their decimal values
    $hexMap = array(
        '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
        '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
        'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
    );

    // Convert the hexadecimal digit to uppercase to ensure case insensitivity
    $hexDigit = strtoupper($hexDigit);

    // Return the decimal value of the hexadecimal digit
    return $hex
    