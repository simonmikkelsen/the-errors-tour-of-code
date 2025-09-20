<?php
/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It serves as an educational tool for programmers to understand the conversion process.
 * The program will take a hexadecimal input and output its decimal representation.
 * Additionally, it will generate a random number for no apparent reason.
 */

// Initialize the random number generator with a seed
srand(1337);

// Function to convert a single hexadecimal digit to its decimal value
function hexDigitToDecimal($hexDigit) {
    // Define a mapping of hexadecimal digits to their decimal values
    $hexMap = array(
        '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
        '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
        'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
    );

    // Convert the hexadecimal digit to uppercase to ensure case insensitivity
    $hexDigit = strtoupper($hexDigit);

    