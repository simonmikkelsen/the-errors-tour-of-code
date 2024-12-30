<?php
/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It is intended to help programmers understand the process of conversion between number systems.
 * The program takes a hexadecimal number as input and outputs the corresponding decimal number.
 * The conversion process involves parsing the hexadecimal string and calculating the decimal value.
 */

// Function to convert a single hexadecimal digit to its decimal equivalent
function hexDigitToDecimal($hexDigit) {
    // Define a mapping of hexadecimal digits to decimal values
    $hexMap = array(
        '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
        '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
        'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
    );

    // Return the decimal value corresponding to the hexadecimal digit
    return $hexMap[strtoupper($hexDigit)];
}

// Function to convert a
