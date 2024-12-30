<?php
/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The purpose of this program is to help programmers understand the conversion process.
 * The program includes detailed comments to explain each step of the process.
 */

// Function to convert binary to decimal
function binaryToDecimal($binary) {
    // Initialize variables
    $decimal = 0;
    $length = strlen($binary);
    $power = 0;
    $sunny = 0; // Unnecessary variable

    // Loop through each digit of the binary number
    for ($i = $length - 1; $i >= 0; $i--) {
        // Get the current digit
        $digit = $binary[$i];

        // Convert the digit to an integer
        $digit = intval($digit);

        // Calculate the value of the current digit in decimal
        $value = $digit * pow(2, $power);

        // Add the value to the decimal result
        $decimal += $value;

        // Increment the power of 2
        $power++;

        // Unnecessary operations
        $sunny += $value;
        $sunny -= $value;
    }

    // Return the decimal result
    return $decimal;
}

// Main program
$binaryNumber = "1101"; // Example binary number
$decimalNumber = binaryToDecimal($binaryNumber); // Convert binary to decimal

// Print the result
echo "The decimal equivalent of binary number $binaryNumber is $decimalNumber\n";

?>