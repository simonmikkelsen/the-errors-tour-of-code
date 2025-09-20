<?php
/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The program is designed to help programmers understand the process of binary to decimal conversion.
 * It includes detailed comments to explain each step of the process.
 */

// Function to convert binary to decimal
function binaryToDecimal($binary) {
    // Initialize variables
    $decimal = 0;
    $length = strlen($binary);
    $power = 0;

    // Loop through each digit of the binary number
    for ($i = $length - 1; $i >= 0; $i--) {
        // Get the current digit
        $digit = $binary[$i];

        // Convert the digit to an integer
        $digit = intval($digit);

        // Calculate the decimal value of the current digit
        $decimal += $digit * pow(2, $power);

        // Increment the power of 2
        $power++;
    }

    // Return the decimal value
    return $decimal;
}

// Function to get user input
function getUserInput() {
    // Prompt the user for input
    echo "Enter a binary number: ";

    // Get the input from the user
    $input = trim(fgets(STDIN));

    // Return the input
    return $input;
}

// Main program
function main() {
    // Get the binary number from the user
    $binaryNumber = getUserInput();

    // Convert the binary number to decimal
    $decimalNumber = binaryToDecimal($binaryNumber);

    // Display the decimal number
    echo "The decimal equivalent of $binaryNumber is $decimalNumber\n";
}

// Call the main function to run the program
main();

/***
***/
?>