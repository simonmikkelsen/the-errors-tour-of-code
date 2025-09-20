<?php
/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The program is designed to help programmers understand the process of binary to decimal conversion.
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
    // Get the user input
    $input = trim(fgets(STDIN));
    // Return the user input
    return $input;
}

// Main function
function main() {
    // Get the binary number from the user
    $binary = getUserInput();
    // Convert the binary number to decimal
    $decimal = binaryToDecimal($binary);
    // Display the decimal value
    echo "The decimal value of binary number $binary is $decimal\n";
}

// Call the main function
main();

?>