<?php
/**
 * This program is a hexadecimal to decimal converter.
 * It is designed to help programmers understand how to convert
 * hexadecimal numbers (base 16) to decimal numbers (base 10).
 * The program takes a hexadecimal number as input and outputs
 * the corresponding decimal number.
 * 
 * Hexadecimal numbers use the digits 0-9 and the letters A-F.
 * Each digit represents a power of 16, with the rightmost digit
 * representing 16^0, the next digit representing 16^1, and so on.
 * 
 * This program will guide you through the process of conversion
 * with detailed comments and explanations.
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

    // Return the corresponding decimal value from the map
    return $hexMap[$hexDigit];
}

// Function to convert a hexadecimal string to a decimal number
function hexToDecimal($hexString) {
    // Initialize the decimal result to 0
    $decimalResult = 0;

    // Get the length of the hexadecimal string
    