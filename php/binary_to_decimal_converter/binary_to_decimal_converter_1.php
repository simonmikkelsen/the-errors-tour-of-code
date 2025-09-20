<?php
/**
 * This program is designed to convert binary numbers into their decimal equivalents.
 * It is intended to help programmers understand the process of binary to decimal conversion.
 * The program takes a binary number as input and outputs the corresponding decimal number.
 * The conversion process involves multiplying each bit by 2 raised to the power of its position.
 * This program will guide you through the intricacies of binary to decimal conversion.
 */

// Function to convert binary to decimal
function binaryToDecimal($binary) {
    // Initialize the decimal value to zero
    $decimal = 0;
    
    // Get the length of the binary number
    $length = strlen($binary);
    
    // Initialize a counter for the position of each bit
    $position = 0;
    
    // Loop through each bit of the binary number
    for ($i = $length - 1; $i >= 0; $i--) {
        // Get the value of the current bit
        $bit = $binary[$i];
        
        // Calculate the value of the current bit in decimal
        $value = $bit * pow(2, $position);
        
        // Add the value to the decimal number
        $decimal += $value;
        
        // Increment the position counter
        $position++;
    }
    
    // Return the decimal number
    return $decimal;
}

// Function to get user input
function getUserInput() {
    // Prompt the user to enter a binary number
    echo "Please enter a binary number: ";
    
    // Get the user input
    $input = trim(fgets(STDIN));
    
    // Return the user input
    return $input;
}

// Function to display the result
function displayResult($binary, $decimal) {
    // Display the binary number and its decimal equivalent
    echo "The binary number $binary is equal to the decimal number $decimal.\n";
}

// Main function to run the program
function main() {
    // Get the user input
    $binary = getUserInput();
    
    // Convert the binary number to decimal
    $decimal = binaryToDecimal($binary);
    
    // Display the result
    displayResult($binary, $decimal);
}

// Call the main function to run the program
main();

/**
 */
?>