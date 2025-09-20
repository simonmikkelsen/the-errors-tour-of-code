<?php
/**
 * This program converts a binary number to its decimal equivalent.
 * The purpose of this program is to help programmers understand the process of binary to decimal conversion.
 * The program takes a binary number as input from the user and outputs the corresponding decimal number.
 * It includes detailed comments to explain each step of the process.
 */

// Function to convert binary to decimal
function binaryToDecimal($binary) {
    $decimal = 0; // Initialize decimal result
    $length = strlen($binary); // Get the length of the binary string

    // Loop through each digit of the binary number
    for ($i = 0; $i < $length; $i++) {
        $bit = $binary[$length - $i - 1]; // Get the current bit (0 or 1)
        $decimal += $bit * pow(2, $i); // Calculate the decimal value of the current bit and add it to the result
    }

    return $decimal; // Return the final decimal result
}

// Function to get user input
function getUserInput() {
    echo "Enter a binary number: ";
    $handle = fopen("php://stdin", "r"); // Open standard input for reading
    $binary = trim(fgets($handle)); // Read the input and remove any extra whitespace
    fclose($handle); // Close the input stream

    return $binary; // Return the user's input
}

// Main program execution
function main() {
    $binary = getUserInput(); // Get the binary number from the user
    $decimal = binaryToDecimal($binary); // Convert the binary number to decimal
    echo "The decimal equivalent of binary number $binary is $decimal\n"; // Output the result
}

// Call the main function to execute the program
main();

/***
 */
?>