<?php
/**
 * This program is a binary to decimal converter.
 * It is designed to help programmers understand how to convert binary numbers to decimal.
 * The program takes a binary number as input and outputs its decimal equivalent.
 * It includes detailed comments to explain each step of the process.
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

        // Check if the digit is 1
        if ($digit == '1') {
            // Calculate the value of the current digit in decimal
            $decimal += pow(2, $i);
        }
    }

    // Return the decimal value
    return $decimal;
}

// Function to get user input
function getUserInput() {
    // Prompt the user for input
    echo "Enter a binary number: ";
    $input = trim(fgets(STDIN));

    // Validate the input
    if (!preg_match('/^[01]+$/', $input)) {
        echo "Invalid binary number.\n";
        exit(1);
    }

    // Return the validated input
    return $input;
}

// Main program execution
function main() {
    // Get the binary number from the user
    $binary = getUserInput();

    // Convert the binary number to decimal
    $decimal = binaryToDecimal($binary);

    // Output the decimal value
    echo "The decimal equivalent of binary $binary is $decimal.\n";
}

// Call the main function to start the program
main();

/***
***/
?>