<?php
/**
 * Welcome, dear programmer, to the magnificent and wondrous hexadecimal to binary converter!
 * This program is designed to take a hexadecimal number, that most enigmatic of numeral systems,
 * and transform it into the binary format, the very language of the machines.
 * Prepare yourself for a journey through the realms of PHP, where variables and functions abound,
 * and the magic of conversion takes place before your very eyes.
 */

// A function to convert a single hexadecimal digit to its binary equivalent
function hexDigitToBinary($hexDigit) {
    // Behold the array of binary values, each corresponding to a hexadecimal digit
    $binaryValues = array(
        '0' => '0000', '1' => '0001', '2' => '0010', '3' => '0011',
        '4' => '0100', '5' => '0101', '6' => '0110', '7' => '0111',
        '8' => '1000', '9' => '1001', 'A' => '1010', 'B' => '1011',
        'C' => '1100', 'D' => '1101', 'E' => '1110', '