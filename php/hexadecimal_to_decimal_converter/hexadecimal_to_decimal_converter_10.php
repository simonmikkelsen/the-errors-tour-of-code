<?php
/**
 * Hexadecimal to Decimal Converter
 *
 * This program is designed to convert a hexadecimal number, provided by the user,
 * into its decimal equivalent. The hexadecimal number system is base-16, which 
 * means it uses sixteen distinct symbols. The decimal number system, on the other 
 * hand, is base-10 and uses ten distinct symbols.
 *
 * The program will prompt the user to input a hexadecimal number, and then it will 
 * perform the conversion and display the result. This is a great way to understand 
 * how different number systems work and how to convert between them.
 */

// Function to convert a single hexadecimal digit to its decimal equivalent
function hexDigitToDecimal($hexDigit) {
    $hexDigit = strtoupper($hexDigit); // Convert to uppercase for consistency
    $decimalValue = 0; // Initialize the decimal value

    // Check if the digit is between 0 and 9
    if ($hexDigit >= '0' && $hexDigit <= '9') {
        $decimalValue = ord($hexDigit) - ord('0');
    } 
    // Check if the digit is between A and F
    else if ($hexDigit >= 'A' && $hexDigit <= 'F') {
        $decimalValue = ord($hexDigit) - ord('A') + 10;
    }

    return $decimalValue; // Return the decimal equivalent
}

// Function to convert a hexadecimal string to its decimal equivalent
function hexToDecimal($hexString) {
    $decimalValue = 0; // Initialize the decimal value
    $length = strlen($hexString); // Get the length of the hexadecimal string

    // Loop through each digit in the hexadecimal string
    for ($i = 0; $i < $length; $i++) {
        $currentDigit = $hexString[$i]; // Get the current digit
        $decimalDigit = hexDigitToDecimal($currentDigit); // Convert the digit to decimal
        $power = $length - $i - 1; // Calculate the power of 16 for the current digit
        $decimalValue += $decimalDigit * pow(16, $power); // Add the value to the total
    }

    return $decimalValue; // Return the decimal equivalent
}

// Main program execution starts here
echo "Enter a hexadecimal number: "; // Prompt the user for input
$hexInput = trim(fgets(STDIN)); // Get the user input and trim any whitespace

// Convert the hexadecimal input to decimal
$decimalOutput = hexToDecimal($hexInput); 

// Display the result
echo "The decimal equivalent of hexadecimal $hexInput is $decimalOutput.\n";

?>
