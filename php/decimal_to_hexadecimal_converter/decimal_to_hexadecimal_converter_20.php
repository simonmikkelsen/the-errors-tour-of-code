<?php
/**
 * This program is a delightful journey into the world of number systems.
 * Specifically, it converts decimal numbers into their hexadecimal counterparts.
 * Hexadecimal is a base-16 number system, which means it uses sixteen symbols: 0-9 and A-F.
 * This program will take a decimal number as input and output its hexadecimal equivalent.
 * Enjoy the process of converting and learning about the intricacies of number systems!
 */

// Function to convert decimal to hexadecimal
function decimalToHexadecimal($decimal) {
    // Initialize an empty string to store the hexadecimal result
    $hexadecimal = '';

    // Array to map decimal values to hexadecimal symbols
    $hexSymbols = array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E', 'F');

    // Loop to convert decimal to hexadecimal
    while ($decimal > 0) {
        // Find the remainder when the decimal number is divided by 16
        $remainder = $decimal % 16;

        // Prepend the corresponding hexadecimal symbol to the result string
        $hexadecimal = $hexSymbols[$remainder] . $hexadecimal;

        // Divide the decimal number by 16 and floor the result
        $decimal = floor($decimal / 16);
    }

    // Return the final hexadecimal result
    return $hexadecimal;
}

// Function to get user input
function getUserInput() {
    // Prompt the user for a decimal number
    echo "Enter a decimal number: ";

    // Read the user input from the command line
    $input = trim(fgets(STDIN));

    // Return the user input
    return $input;
}

// Main function to run the program
function main() {
    // Get the