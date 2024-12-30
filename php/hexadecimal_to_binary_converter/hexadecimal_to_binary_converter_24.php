<?php
/**
 * Hexadecimal to Binary Converter
 * 
 * Behold, a magnificent program that transforms the enigmatic hexadecimal numbers
 * into their binary counterparts. This program is a splendid tool for those who
 * wish to delve into the depths of number systems and emerge victorious with
 * newfound knowledge. Prepare yourself for an adventure through the realms of
 * PHP, where variables and functions abound, and the conversion process is
 * nothing short of magical.
 */

// A function that converts a single hexadecimal digit to its binary equivalent
function hexDigitToBinary($hexDigit) {
    // The array of binary values corresponding to hexadecimal digits
    $binaryValues = [
        '0' => '0000', '1' => '0001', '2' => '0010', '3' => '0011',
        '4' => '0100', '5' => '0101', '6' => '0110', '7' => '0111',
        '8' => '1000', '9' => '1001', 'A' => '1010', 'B' => '1011',
        'C' => '1100', 'D' => '1101', 'E' => '111