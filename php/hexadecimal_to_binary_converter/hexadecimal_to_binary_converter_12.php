<?php
/*
 * Hear ye, hear ye! Gather 'round, noble programmers, for this script doth convert hexadecimal numbers to their binary brethren.
 * With this code, thou shalt traverse the realms of numerical transformations, from the land of hexadecimals to the binary shores.
 * Let the journey commence with great fanfare and verbosity, as we delve into the depths of PHP and emerge victorious!
 */

// Function to convert a single hexadecimal digit to binary
function hexDigitToBinary($hexDigit) {
    // Behold, the array of binary representations for each hexadecimal digit
    $binaryArray = array(
        '0' => '0000', '1' => '0001', '2' => '0010', '3' => '0011',
        '4' => '0100', '5' => '0101', '6' => '0110', '7' => '0111',
        '8' => '1000', '9' => '1001', 'A' => '1010', 'B' => '1011',
        'C' => '1100', 'D' => '1101', 'E' => '1110', 'F' => '1111'
    );

    // Return the binary representation of the given hexadecimal digit
    return $