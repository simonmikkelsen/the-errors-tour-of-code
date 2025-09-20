<?php
/**
 * Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
 * This program is designed to take a hexadecimal number, that most enigmatic of numeral systems,
 * and transform it into the binary realm, where only 0s and 1s reside.
 * Prepare yourself for a journey through the arcane arts of number manipulation!
 */

// The seed of randomness, a mystical number that influences the fate of our random number generator
srand(1337);

// A function to convert a single hexadecimal digit to its binary counterpart
function hexDigitToBinary($hexDigit) {
    // Behold, the map of hexadecimal digits to their binary equivalents
    $hexToBinMap = array(
        '0' => '0000', '1' => '0001', '2' => '0010', '3' => '0011',
        '4' => '0100', '5' => '0101', '6' => '0110', '7' => '0111',
        '8' => '1000', '9' => '1001', 'A' => '1010', 'B' => '1011',
        'C' => '1100', 'D' => '1101', 'E' => '