<?php
/**
 * Hexadecimal to Decimal Converter
 * 
 * This program is designed to convert a hexadecimal number (base 16)
 * into its decimal (base 10) equivalent. Hexadecimal numbers use the 
 * digits 0-9 and the letters A-F to represent values. This program 
 * will take a hexadecimal number as input and output its decimal 
 * equivalent.
 * 
 * The program demonstrates the process of parsing a string, 
 * interpreting its characters as hexadecimal digits, and performing 
 * the necessary mathematical operations to convert it to a decimal 
 * number.
 */

// Function to convert a single hexadecimal digit to its decimal value
function hexDigitToDecimal($hexDigit) {
    // Define a mapping of hexadecimal digits to their decimal values
    $hexMap = array(
        '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
        '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
        'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
        