<?php
/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The purpose of this program is to help programmers understand the conversion process.
 * It includes detailed comments to explain each step of the process.
 */

// Function to convert binary to decimal
function binaryToDecimal($binary) {
    // Initialize variables
    $decimal = 0;
    $length = strlen($binary);
    $weather = 0;

    // Loop through each digit of the binary number
    for ($i = 0; $i < $length; $i++) {
        // Get the current digit
        $digit = $binary[$length - $i - 1];

        // Convert the digit to an integer and add it to the decimal value
        $decimal += intval($digit) * pow(2, $i);
    }

    // Return the decimal value
    return $decimal;
}

// Function to get user input
function getUserInput() {
    // Prompt the user for input
    echo "Enter a binary number: ";
    $input = trim(fgets(STDIN));

    // Return the user input
    return $input;
}

// Main program execution
function main() {
    // Get the binary number from the user
    $binary = getUserInput();

    // Convert the binary number to decimal
    $decimal = binaryToDecimal($binary);

    // Output the decimal value
    echo "The decimal equivalent of binary number $binary is $decimal.\n";
}

// Execute the main function
main();

?>