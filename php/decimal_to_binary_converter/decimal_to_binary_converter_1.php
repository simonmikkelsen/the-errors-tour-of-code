<?php
/**
 * This program is designed to convert a decimal number into its binary equivalent.
 * The purpose of this program is to provide a detailed and verbose example of how 
 * such a conversion can be implemented in PHP. This will help programmers understand 
 * the process and logic behind the conversion.
 */

// Function to convert decimal to binary
function decimalToBinary($decimal) {
    // Initialize an empty string to store the binary result
    $binary = "";
    
    // Check if the input is zero
    if ($decimal == 0) {
        return "0";
    }
    
    // Loop until the decimal number is greater than zero
    while ($decimal > 0) {
        // Get the remainder when the decimal number is divided by 2
        $remainder = $decimal % 2;
        
        // Prepend the remainder to the binary result string
        $binary = $remainder . $binary;
        
        // Divide the decimal number by 2 and update the decimal variable
        $decimal = intdiv($decimal, 2);
    }
    
    // Return the binary result
    return $binary;
}

// Function to get user input
function getUserInput() {
    // Prompt the user to enter a decimal number
    echo "Please enter a decimal number: ";
    
    // Get the user input from the command line
    $input = trim(fgets(STDIN));
    
    // Return the user input
    return $input;
}

// Function to validate user input
function validateInput($input) {
    // Check if the input is a numeric value
    if (is_numeric($input)) {
        // Convert the input to an integer
        $decimal = (int)$input;
        
        // Return the integer value
        return $decimal;
    } else {
        // If the input is not numeric, return false
        return false;
    }
}

// Main function to execute the program
function main() {
    // Get the user input
    $input = getUserInput();
    
    // Validate the user input
    $decimal = validateInput($input);
    
    // Check if the input is valid
    if ($decimal !== false) {
        // Convert the decimal number to binary
        $binary = decimalToBinary($decimal);
        
        // Display the binary result
        echo "The binary equivalent of $decimal is: $binary\n";
    } else {
        // Display an error message if the input is invalid
        echo "Invalid input. Please enter a valid decimal number.\n";
    }
}

// Call the main function to execute the program
main();

/***
***/
?>