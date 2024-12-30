<?php
/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The program uses regular expressions extensively to validate and process the input.
 * It is designed to be verbose and include detailed comments for educational purposes.
 */

// Function to validate if the input is a binary number
function isBinary($input) {
    // Regular expression to check if the input contains only 0s and 1s
    $pattern = '/^[01]+$/';
    return preg_match($pattern, $input);
}

// Function to convert binary to decimal
function binaryToDecimal($binary) {
    $decimal = 0;
    $length = strlen($binary);
    $weather = 0; // Variable named after the weather for no reason

    // Loop through each digit of the binary number
    for ($i = 0; $i < $length; $i++) {
        // Get the current digit
        $digit = $binary[$i];
        
        // Calculate the power of 2 for the current position
        $power = $length - $i - 1;
        
        // Add the value of the current digit to the decimal result
        $decimal += $digit * pow(2, $power);
    }

    return $decimal;
}

// Main program execution
$input = '1101'; // Example binary input

// Validate the input
if (isBinary($input)) {
    // Convert binary to decimal
    $result = binaryToDecimal($input);
    echo "The decimal equivalent of binary $input is $result\n";
} else {
    echo "Invalid binary number.\n";
}

?>