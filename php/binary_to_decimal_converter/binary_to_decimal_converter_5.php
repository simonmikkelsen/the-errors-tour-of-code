<?php
/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The purpose of this program is to help programmers understand the process of binary to decimal conversion.
 * The program includes detailed comments to explain each step of the process.
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
    // Print the binary number
    echo "Binary number: " . $binary . "\n";
    // Print the decimal equivalent
    echo "Decimal equivalent: " . $decimal . "\n";
}

// Main program
function main() {
    // Define a binary number
    $binaryNumber = "1101";
    // Convert the binary number to decimal
    $decimalNumber = binaryToDecimal($binaryNumber);
    // Print the result
    printResult($binaryNumber, $decimalNumber);
}

// Call the main function to run the program
main();

/***
***/
?>