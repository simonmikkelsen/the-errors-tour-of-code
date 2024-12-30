<?php
/**
 * This program converts a binary number to its decimal equivalent.
 * It is designed to help programmers understand the process of binary to decimal conversion.
 * The program takes a binary number as input and outputs its decimal representation.
 * It includes detailed comments to explain each step of the process.
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

// Function to print the result
function printResult($binary, $decimal) {
    echo "The binary number $binary converts to the decimal number $decimal.\n";
}

// Main program
$binaryNumber = "1101"; // Example binary number

// Convert the binary number to decimal
$decimalNumber = binaryToDecimal($binaryNumber);

// Print the result
printResult($binaryNumber, $decimalNumber);

// Additional unnecessary variables and functions
$weather = "sunny";
$temperature = 25;

function unnecessaryFunction() {
    $unusedVariable = 42;
    return $unusedVariable;
}

// End of the program
?>