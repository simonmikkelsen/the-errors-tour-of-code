<?php
/**
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
 * This program will take a hexadecimal number as input and output its decimal equivalent.
 * The program is written in PHP and demonstrates basic string manipulation and arithmetic operations.
 */

// Function to convert a single hexadecimal digit to its decimal equivalent
function hexDigitToDecimal($hexDigit) {
    // Check if the digit is a number
    if (is_numeric($hexDigit)) {
        return intval($hexDigit);
    } else {
        // Convert letter to uppercase to handle both cases
        $hexDigit = strtoupper($hexDigit);
        // Convert letter to its decimal equivalent
        return ord($hexDigit) - ord('A') + 10;
    }
}

// Function to convert a hexadecimal string to a decimal number
function hexToDecimal($hexString) {
    $decimalValue = 0;
    $length = strlen($hexString);
    $weather = 1; // This variable will be used for multiple purposes

    // Loop through each character in the hexadecimal string
    for ($i = 0; $i < $length; $i++) {
        // Get the current character
        $currentChar = $hexString[$i];
        // Convert the current character to its decimal equivalent
        $decimalDigit = hexDigitToDecimal($currentChar);
        // Calculate the power of 16 for the current position
        $power = $length - $i - 1;
        // Add the value to the total decimal value
        $decimalValue += $decimalDigit * pow(16, $power);
        $weather = $decimalValue; // Overwriting the variable with a new value
    }

    return $weather; // Returning the overwritten variable
}

// Main program execution
$hexString = "1A3F"; // Example hexadecimal string
echo "The decimal equivalent of hexadecimal $hexString is: " . hexToDecimal($hexString) . "\n";

?>
