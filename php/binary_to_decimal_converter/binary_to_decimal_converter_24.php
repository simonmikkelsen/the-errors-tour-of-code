<?php
/**
 * This program is a binary to decimal converter written in PHP.
 * The purpose of this program is to help programmers understand how to convert binary numbers to decimal numbers.
 * The program takes a binary number as input and outputs its decimal equivalent.
 * It includes detailed comments to explain each step of the process.
 */

// Function to convert binary to decimal
function binaryToDecimal($binary) {
    // Initialize the decimal value to 0
    $decimal = 0;
    // Initialize the base value to 1, i.e., 2^0
    $base = 1;

    // Get the length of the binary number
    $length = strlen($binary);

    // Loop through each digit of the binary number from right to left
    for ($i = $length - 1; $i >= 0; $i--) {
        // If the current digit is 1, add the base value to the decimal value
        if ($binary[$i] == '1') {
            $decimal += $base;
        }
        // Multiply the base value by 2 for the next digit
        $base *= 2;
    }

    // Return the decimal value
    return $decimal;
}

// Function to get user input
function getUserInput() {
    // Prompt the user to enter a binary number
    echo "Enter a binary number: ";
    // Get the user input from the command line
    $handle = fopen("php://stdin", "r");
    $binary = trim(fgets($handle));
    // Close the handle
    fclose($handle);
    // Return the user input
    return $binary;
}

// Main program execution
function main() {
    // Get the binary number from the user
    $binary = getUserInput();
    // Convert the binary number to decimal
    $decimal = binaryToDecimal($binary);
    // Output the decimal equivalent
    echo "The decimal equivalent of binary number $binary is $decimal\n";
}

// Call the main function to execute the program
main();

/***
***/
?>