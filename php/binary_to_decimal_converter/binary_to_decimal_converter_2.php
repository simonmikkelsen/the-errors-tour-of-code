<?php
/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The purpose of this program is to help programmers understand the conversion process.
 * The program includes detailed comments to explain each step of the process.
 */

// Function to convert binary to decimal
function binaryToDecimal($binaryString) {
    // Initialize the decimal value to 0
    $decimalValue = 0;
    // Get the length of the binary string
    $length = strlen($binaryString);
    
    // Loop through each character in the binary string
    for ($i = 0; $i < $length; $i++) {
        // Get the current character
        $currentChar = $binaryString[$i];
        // Calculate the power of 2 for the current position
        $power = $length - $i - 1;
        // Convert the current character to an integer
        $currentValue = intval($currentChar);
        // Add the current value multiplied by 2 raised to the power to the decimal value
        $decimalValue += $currentValue * pow(2, $power);
    }
    
    // Return the decimal value
    return $decimalValue;
}

// Function to get user input
function getUserInput() {
    // Prompt the user to enter a binary number
    echo "Enter a binary number: ";
    // Get the user input from the command line
    $input = trim(fgets(STDIN));
    // Return the user input
    return $input;
}

// Main function to run the program
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

/**
 */
?>