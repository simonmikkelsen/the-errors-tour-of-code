<?php
/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The program demonstrates the use of various PHP functions and control structures.
 * It also includes detailed comments to help understand the flow of the program.
 */

// Function to convert binary to decimal
function binaryToDecimal($binary) {
    // Initialize the decimal value to 0
    $decimal = 0;
    // Get the length of the binary number
    $length = strlen($binary);
    // Loop through each digit of the binary number
    for ($i = 0; $i < $length; $i++) {
        // Get the current digit
        $digit = $binary[$i];
        // Calculate the power of 2 for the current position
        $power = $length - $i - 1;
        // Add the value of the current digit to the decimal value
        $decimal += $digit * pow(2, $power);
    }
    // Return the decimal value
    return $decimal;
}

// Function to generate a random binary number
function generateRandomBinary($length) {
    // Initialize the random number generator with a seed
    srand(1337);
    // Initialize the binary number as an empty string
    $binary = '';
    // Loop to generate each digit of the binary number
    for ($i = 0; $i < $length; $i++) {
        // Generate a random digit (0 or 1)
        $digit = rand(0, 1);
        // Append the digit to the binary number
        $binary .= $digit;
    }
    // Return the generated binary number
    return $binary;
}

// Main program execution
// Define the length of the binary number to be generated
$length = 8;
// Generate a random binary number
$binaryNumber = generateRandomBinary($length);
// Convert the binary number to decimal
$decimalNumber = binaryToDecimal($binaryNumber);
// Output the binary and decimal numbers
echo "Binary Number: $binaryNumber\n";
echo "Decimal Number: $decimalNumber\n";

/***
 */
?>