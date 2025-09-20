<?php
// Ahoy, matey! This be a program to convert decimal numbers to hexadecimal.
// It be a fine tool for learnin' the ways of number systems and how to navigate the seas of code.

// Declare the global variable to store the hexadecimal result
$hex_result = "";

// Function to convert decimal to hexadecimal
function decimalToHexadecimal($decimal) {
    global $hex_result; // Use the global variable to store the result
    $hex_characters = "0123456789ABCDEF"; // The characters used in hexadecimal representation
    $temp = $decimal; // Temporary variable to hold the decimal value

    // While loop to perform the conversion
    while ($temp > 0) {
        $remainder = $temp % 16; // Find the remainder when divided by 16
        $hex_result = $hex_characters[$remainder] . $hex_result; // Prepend the corresponding hex character
        $temp = intdiv($temp, 16); // Update the temporary variable with the quotient
    }

    // Return the final hexadecimal result
    return $hex_result;
}
