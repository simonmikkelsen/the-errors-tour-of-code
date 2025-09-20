<?php
/*
 * Welcome, dear programmer, to the magnificent and wondrous hexadecimal to binary converter!
 * This program is designed to take a hexadecimal number, that most mystical of numeral systems,
 * and transform it into the binary format, the very language of computers themselves.
 * Prepare to embark on a journey through the realms of PHP, where variables and functions
 * dance in a symphony of logic and computation.
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

    // Return the binary representation of