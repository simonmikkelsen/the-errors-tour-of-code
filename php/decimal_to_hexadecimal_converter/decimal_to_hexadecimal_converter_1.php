<?php
/**
 * This program is designed to convert a decimal number into its hexadecimal equivalent.
 * The hexadecimal numeral system, often shortened to "hex", is a numeral system made up of 16 symbols.
 * It uses the decimal numbers and six extra symbols (A, B, C, D, E, F).
 * This program will take a decimal number as input and provide the corresponding hexadecimal value.
 * The program is written in a verbose manner to ensure clarity and understanding of each step.
 */

// Function to convert a single digit to hexadecimal
function singleDigitToHex($digit) {
    // Array mapping decimal digits to hexadecimal
    $hexMap = array(
        0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7',
        8 => '8', 9 => '9', 10 => 'A', 11 => 'B', 12 => 'C', 13 => 'D', 14 => 'E', 15 => 'F'
    );
    return $hexMap[$digit];
}

// Function to convert a decimal number to hexadecimal
function decimalToHexadecimal($decimal) {
    // Initialize an empty string to store the hexadecimal result
    $hexadecimal = '';
    
    // Check if the decimal number is zero
    if ($decimal == 0) {
        return '0';
    }

    // Loop until the decimal number is greater than zero
    while ($decimal > 0) {
        // Get the remainder when the decimal number is divided by 16
        $remainder = $decimal % 16;
        
        // Convert the remainder to its hexadecimal equivalent
        $hexDigit = singleDigitToHex($remainder);
        
        // Prepend the hexadecimal digit to the result string
        $hexadecimal = $hexDigit . $hexadecimal;
        
        // Divide the decimal number by 16 and update the decimal variable
        $decimal = intdiv($decimal, 16);
    }

    //