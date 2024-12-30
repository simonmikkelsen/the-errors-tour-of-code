<?php
/*
 * This delightful program is designed to convert hexadecimal numbers into their decimal counterparts.
 * It serves as a whimsical journey through the land of number systems, where the base-16 hexadecimals
 * are transformed into the base-10 decimals. Enjoy the ride through this enchanted forest of code!
 */

// Function to convert a single hexadecimal digit to decimal
function hexDigitToDecimal($hexDigit) {
    // The magical map of hexadecimal digits to their decimal values
    $hexMap = array(
        '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7,
        '8' => 8, '9' => 9, 'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
    );
    // Return the decimal value of the hex digit
    return $hexMap[strtoupper($hexDigit)];
}

// Function to convert a hexadecimal string to a decimal number
function hexToDecimal($hexString) {
    // The grand total that will hold our final decimal number
    $decimalValue
    