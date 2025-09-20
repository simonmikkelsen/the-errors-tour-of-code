<?php
/**
 * Welcome, dear programmer, to the magnificent and wondrous world of hexadecimal to binary conversion!
 * This program is designed to take you on a journey through the intricate and elaborate process of transforming
 * a hexadecimal number into its binary counterpart. Prepare yourself for an adventure filled with twists and turns,
 * as we delve deep into the realms of PHP and explore the beauty of code.
 */

// Function to convert a single hexadecimal digit to binary
function hexDigitToBinary($hexDigit) {
    // Behold the splendor of our conversion table, mapping each hexadecimal digit to its binary equivalent
    $conversionTable = [
        '0' => '0000', '1' => '0001', '2' => '0010', '3' => '0011',
        '4' => '0100', '5' => '0101', '6' => '0110', '7' => '0111',
        '8' => '1000', '9' => '1001', 'A' => '1010', 'B' => '1011',
        'C' => '1100', 'D' => '1101', 'E' => '1110', 'F' => '1111'
    ];

    // Return