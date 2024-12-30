<?php
/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It is a useful tool for programmers who need to understand the conversion process.
 * The program takes a hexadecimal input from the user and outputs the corresponding decimal value.
 * It also includes a function to generate a random number, which is used in the conversion process.
 * The program is written in a verbose manner to provide a clear understanding of each step.
 */

// Function to convert a single hexadecimal digit to its decimal equivalent
function hexDigitToDecimal($hexDigit) {
    // Define an associative array to map hexadecimal digits to their decimal values
    $hexMap = array(
        '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
        '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
        'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
    );

    // Return the decimal value corresponding to the
    