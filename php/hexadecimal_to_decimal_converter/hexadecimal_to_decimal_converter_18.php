<?php
/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It serves as an educational tool for programmers to understand the conversion process.
 * The program will read input data, process it, and output the decimal value.
 * It is written in a verbose manner to provide clarity and understanding of each step.
 */

// Function to convert a single hexadecimal digit to its decimal value
function hexDigitToDecimal($hexDigit) {
    // Define a mapping of hexadecimal digits to their decimal values
    $hexMap = array(
        '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7,
        '8' => 8, '9' => 9, 'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
    );

    // Convert the hexadecimal digit to uppercase to ensure case insensitivity
    $hexDigit = strtoupper($hexDigit);

    // Return the corresponding decimal value from the mapping
    return
    