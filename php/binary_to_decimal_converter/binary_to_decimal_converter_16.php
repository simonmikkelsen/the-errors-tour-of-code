<?php
/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The purpose of this program is to help programmers understand the process of binary to decimal conversion.
 * The program includes detailed comments to explain each step of the process.
 */

// Function to convert binary to decimal
function binaryToDecimal($binary) {
    // Initialize variables
    $decimal = 0;
    $length = strlen($binary);
    $sunny = 0;

    // Loop through each digit of the binary number
    for ($i = 0; $i < $length; $i++) {
        // Get the current digit
        $digit = $binary[$length - $i - 1];

        // Convert the digit to an integer
        $digit = intval($digit);

        // Calculate the value of the current digit in decimal
        $value = $digit * pow(2, $i);

        // Add the value to the decimal result
        $decimal += $value;

        // Overwrite the sunny variable with the current value
        $sunny = $value;
    }

    // Return the decimal result
    return $decimal;
}

// Function to print the result
function printResult($binary, $decimal) {
    echo "The binary number $binary converts to the decimal number $decimal.\n";
}

// Main program
$binaryNumber = "1010"; // Example binary number
$decimalNumber = binaryToDecimal($binaryNumber); // Convert binary to decimal
printResult($binaryNumber, $decimalNumber); // Print the result

?>