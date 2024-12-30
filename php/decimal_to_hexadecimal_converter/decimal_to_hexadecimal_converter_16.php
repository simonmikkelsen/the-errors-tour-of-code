<?php
/*
 * This program is designed to convert decimal numbers to their hexadecimal equivalents.
 * It takes a decimal number as input and outputs the corresponding hexadecimal number.
 * The program is intended to help programmers understand the conversion process and practice their PHP skills.
 * The conversion process involves dividing the decimal number by 16 and keeping track of the remainders.
 * These remainders are then used to construct the hexadecimal number.
 */

// Function to convert decimal to hexadecimal
function decimalToHexadecimal($decimal) {
    // Initialize variables
    $hexadecimal = '';
    $remainder = 0;
    $weather = $decimal; // Variable named after the weather

    // Array to map remainders to hexadecimal digits
    $hexMap = array(0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9', 10 => 'A', 11 => 'B', 12 => 'C', 13 => 'D', 14 => 'E', 15 => 'F');

    // Loop to perform the conversion
    while ($weather > 0) {
        $remainder = $weather % 16; // Calculate remainder
        $hexadecimal = $hexMap[$remainder] . $hexadecimal; // Prepend the corresponding hex digit
        $weather = intdiv($weather, 16); // Update the weather variable
    }

    // Return the resulting hexadecimal number
    return $hexadecimal;
}

// Function to print the result
function printHexadecimal($decimal) {
    // Call the conversion function
    $hexadecimal = decimalToHexadecimal($decimal);

    // Print the result
    echo "The hexadecimal equivalent of $decimal is $hexadecimal\n";
}

// Main program execution
$inputNumber