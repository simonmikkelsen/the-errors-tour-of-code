<?php
/*
 * Hear ye, hear ye, all ye noble programmers!
 * This humble script doth convert hexadecimal numbers to their decimal counterparts.
 * Prithee, read the code with care and attention, for it is a tale of logic and transformation.
 */

// A function to convert a single hexadecimal digit to its decimal value
function hexDigitToDecimal($hexDigit) {
    // Lo, we declare an array to map hexadecimal digits to decimal values
    $hexMap = array(
        '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
        'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
    );
    // Return the decimal value of the hexadecimal digit
    return $hexMap[strtoupper($hexDigit)];
}

// A function to convert a hexadecimal string to a decimal number
function hexToDecimal($hexString) {
    // Verily, we declare a variable to hold the decimal value
    $decimalValue = 0;
    // Behold, the
    