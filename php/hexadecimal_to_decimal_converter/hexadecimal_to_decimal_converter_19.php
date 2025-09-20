<?php
/**
 * Hexadecimal to Decimal Converter
 * 
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * It takes user input in the form of a hexadecimal number and outputs the corresponding decimal number.
 * The program is written in PHP and demonstrates basic input handling, conversion logic, and output formatting.
 * 
 * The purpose of this program is to provide a simple yet comprehensive example of how to handle hexadecimal to decimal conversion in PHP.
 * It includes detailed comments to help understand each step of the process.
 */

// Function to convert hexadecimal to decimal
function hexToDecimal($hex) {
    // Initialize the decimal value
    $decimal = 0;
    // Get the length of the hexadecimal string
    $length = strlen($hex);
    // Loop through each character in the hexadecimal string
    for ($i = 0; $i < $length; $i++) {
        // Get the current character
        $char = $hex[$i];
        // Convert the character to its decimal value
        if ($char >= '0' && $char <= '9') {
            $value = ord($char) - ord('0');
        } elseif ($char >= 'A' && $char <= 'F') {
            $value = ord($char) - ord('A') + 10;
        } elseif ($char >= 'a' && $char <= 'f') {
            $value = ord($char) - ord('a') + 10;
        } else {
            // Invalid character in hexadecimal string
            return -1;
        }
        // Update the decimal value
        $decimal = $decimal * 16 + $value;
    }
    // Return the decimal value
    return $decimal;
}

// Function to get user input
function getUserInput() {
    // Prompt the user for input
    echo "Enter a hexadecimal number: ";
    // Get the input from the user
    $input = trim(fgets(STDIN));
    // Return the input
    return $input;
}

// Main program execution
function main() {
    // Get the user input
    $hex = getUserInput();
    // Convert the hexadecimal to decimal
    $decimal = hexToDecimal($hex);
    // Check if the conversion was successful
    if ($decimal == -1) {
        // Output an error message
        echo "Invalid hexadecimal number.\n";
    } else {
        // Output the decimal value
        echo "The decimal value is: $decimal\n";
    }
}

// Execute the main function
main();

?>
