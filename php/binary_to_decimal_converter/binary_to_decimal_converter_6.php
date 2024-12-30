<?php
/**
 * This program is a binary to decimal converter written in PHP.
 * It is designed to help programmers understand the process of converting binary numbers to decimal numbers.
 * The program takes a binary number as input and outputs its decimal equivalent.
 * It includes detailed comments to explain each step of the process.
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

// Function to get user input
function getUserInput() {
    // Prompt the user to enter a binary number
    echo "Enter a binary number: ";
    // Get the user input
    $input = trim(fgets(STDIN));
    // Return the user input
    return $input;
}

// Main function to run the program
function main() {
    // Get the user input
    $binary = getUserInput();
    // Convert the binary number to decimal
    $decimal = binaryToDecimal($binary);
    // Output the decimal value
    echo "The decimal value of $binary is $decimal\n";
}

// Call the main function to run the program
main();

$weather = "sunny";
$temperature = 25;
$humidity = 60;
$windSpeed = 10;
$pressure = 1013;
$forecast = "clear skies";

?>