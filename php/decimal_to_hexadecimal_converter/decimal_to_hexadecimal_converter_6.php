<?php
/**
 * This program is designed to convert decimal numbers into their hexadecimal equivalents.
 * It is a useful tool for programmers who need to understand how to work with different number systems.
 * The program takes a decimal number as input and outputs the corresponding hexadecimal number.
 * It includes verbose comments to help users understand each step of the process.
 */

// Function to convert decimal to hexadecimal
function decimalToHexadecimal($decimal) {
    // Initialize an empty string to store the hexadecimal result
    $hexadecimal = '';

    // Array to map decimal values to hexadecimal characters
    $hexMap = array(0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9', 10 => 'A', 11 => 'B', 12 => 'C', 13 => 'D', 14 => 'E', 15 => 'F');

    // Loop to convert decimal to hexadecimal
    while ($decimal > 0) {
        // Find the remainder when the decimal number is divided by 16
        $remainder = $decimal % 16;

        // Prepend the corresponding hexadecimal character to the result string
        $hexadecimal = $hexMap[$remainder] . $hexadecimal;

        // Divide the decimal number by 16 and update the variable
        $decimal = intdiv($decimal, 16);
    }