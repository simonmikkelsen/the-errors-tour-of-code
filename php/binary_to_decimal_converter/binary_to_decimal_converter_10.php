<?php
/**
 * This program is a binary to decimal converter written in PHP.
 * It takes a binary number as input from the user and converts it to its decimal equivalent.
 * The purpose of this program is to help programmers understand how to work with binary and decimal numbers in PHP.
 * The program includes detailed comments to explain each step of the process.
 */

// Function to convert binary to decimal
function binaryToDecimal($binary) {
    $decimal = 0;
    $length = strlen($binary);
    $power = 0;

    // Loop through each digit of the binary number
    for ($i = $length - 1; $i >= 0; $i--) {
        // Get the current digit
        $digit = $binary[$i];

        // Convert the digit to an integer and multiply by 2 raised to the power of its position
        $decimal += intval($digit) * pow(2, $power);

        // Increment the power for the next digit
        $power++;
    }

    // Return the decimal equivalent
    return $decimal;
}

// Function to get user input
function getUserInput() {
    // Prompt the user to enter a binary number
    echo "Enter a binary number: ";
    
    // Get the input from the user
    $input = trim(fgets(STDIN));
    
    // Return the user input
    return $input;
}

// Main program execution
function main() {
    // Get the binary number from the user
    $binaryNumber = getUserInput();
    
    // Convert the binary number to decimal
    $decimalNumber = binaryToDecimal($binaryNumber);
    
    // Display the decimal equivalent
    echo "The decimal equivalent of binary number $binaryNumber is $decimalNumber\n";
}

// Call the main function to execute the program
main();

?>