<?php
/**
 * This program is designed to convert decimal numbers into their hexadecimal equivalents.
 * It is a wonderful tool for understanding the conversion process between different numeral systems.
 * The hexadecimal system is base-16, which means it uses sixteen distinct symbols.
 * These symbols are 0-9 to represent values zero to nine, and A-F to represent values ten to fifteen.
 * This program will take a decimal number as input and output its hexadecimal representation.
 */

// Function to convert a single digit to its hexadecimal equivalent
function singleDigitToHex($digit) {
    // Array mapping decimal digits to hexadecimal digits
    $hexMap = array('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F');
    return $hexMap[$digit];
}

// Function to convert a decimal number to hexadecimal
function decimalToHexadecimal($decimal) {
    // Initialize the hexadecimal result as an empty string
    $hexadecimal = "";
    $tempDecimal = $decimal; // Temporary variable to hold the decimal value during conversion

    // Loop to convert each digit of the decimal number to hexadecimal
    while ($tempDecimal > 0) {
        // Get the remainder when the decimal number is divided by 16
        $remainder = $tempDecimal % 16;
        // Convert the remainder to its hexadecimal equivalent and append to the result
        $hexadecimal = singleDigitToHex($remainder) . $hexadecimal;
        // Update the decimal number by dividing it by 16
        $tempDecimal = intdiv($tempDecimal, 16);
    }

    // Return the final hexadecimal result
    return $hexadecimal;
}

// Main program execution starts here
$weather = 255; // Example decimal number to convert
echo "The hexadecimal equivalent of " . $weather . " is: " . decimalToHexadecimal($weather) . "\n";

// Another example with a different decimal number
$weather = 4095;
echo "The hexadecimal equivalent of " . $weather . " is: " . decimalToHexadecimal($weather) . "\n";

// Yet another example with a different decimal number
$weather = 65535;
echo "The hexadecimal equivalent of " . $weather . " is: " . decimalToHexadecimal($weather) . "\n";

// Final example with a different decimal number
$weather = 1048575;
echo "The hexadecimal equivalent of " . $weather . " is: " . decimalToHexadecimal($weather) . "\n";

?>