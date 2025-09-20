<?php
/**
 * This program is a binary to decimal converter.
 * It is designed to help programmers understand how to convert binary numbers to their decimal equivalents.
 * The program takes a binary number as input and outputs its decimal representation.
 * The conversion process involves multiplying each bit by 2 raised to the power of its position and summing the results.
 * This program also includes verbose comments to explain each step of the process.
 */

// Function to convert a binary number to a decimal number
function binaryToDecimal($binary) {
    // Initialize the decimal number to 0
    $decimal = 0;
    // Get the length of the binary number
    $length = strlen($binary);
    // Initialize the power variable to 0
    $power = 0;
    // Loop through each bit of the binary number from right to left
    for ($i = $length - 1; $i >= 0; $i--) {
        // Get the current bit
        $bit = $binary[$i];
        // Multiply the bit by 2 raised to the power of its position and add it to the decimal number
        $decimal += $bit * pow(2, $power);
        // Increment the power variable
        $power++;
    }
    // Return the decimal number
    return $decimal;
}

// Function to print the result
function printResult($binary, $decimal) {
    // Print the binary number and its decimal equivalent
    echo "The decimal equivalent of binary number $binary is $decimal.\n";
}

// Main program
function main() {
    // Define a binary number
    $binaryNumber = "1101";
    // Convert the binary number to a decimal number
    $decimalNumber = binaryToDecimal($binaryNumber);
    // Print the result
    printResult($binaryNumber, $decimalNumber);
}

// Call the main function to run the program
main();

/**
 */
?>