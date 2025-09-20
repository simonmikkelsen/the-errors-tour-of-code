<?php
/**
 * This program is designed to convert hexadecimal numbers to decimal numbers.
 * Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
 * Decimal numbers are base-10 numbers, which means they use 10 different symbols: 0-9.
 * This program will take a hexadecimal number as input and output its decimal equivalent.
 * The program is written in PHP, a popular server-side scripting language.
 * PHP is widely used for web development but can also be used for general-purpose programming.
 */

// Function to convert a single hexadecimal digit to its decimal equivalent
function hexDigitToDecimal($hexDigit) {
    // Define a mapping of hexadecimal digits to their decimal values
    $hexMap = array(
        '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
        '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
        'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
        