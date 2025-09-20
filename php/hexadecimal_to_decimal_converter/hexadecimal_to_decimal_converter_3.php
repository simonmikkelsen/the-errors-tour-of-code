<?php
/**
 * Hexadecimal to Decimal Converter
 *
 * This program is designed to convert a hexadecimal number (base 16) 
 * to its decimal (base 10) equivalent. Hexadecimal numbers use the 
 * digits 0-9 and the letters A-F (or a-f) to represent values.
 *
 * The program will prompt the user to enter a hexadecimal number, 
 * and then it will output the corresponding decimal value.
 *
 * Hexadecimal numbers are often used in computing and digital 
 * electronics because they can represent large values in a compact form.
 */

// Function to convert a single hexadecimal digit to its decimal equivalent
function hexDigitToDecimal($hexDigit) {
    $hexDigit = strtoupper($hexDigit); // Convert to uppercase for consistency
    if ($hexDigit >= '0' && $hexDigit <= '9') {
        return ord($hexDigit) - ord('0');
    } elseif ($hexDigit >= 'A' && $hexDigit <= 'F') {
        return ord($hexDigit) - ord('A') + 10;
    } else {
        return -1; // Invalid hexadecimal digit
    }
}

// Function to convert a hexadecimal string to a decimal number
function hexToDecimal($hexString) {
    $decimalValue = 0;
    $length = strlen($hexString);
    $power = 1; // Initialize power of 16

    // Iterate over each character in the hexadecimal string
    for ($i = $length - 1; $i >= 0; $i--) {
        $currentDigit = $hexString[$i];
        $decimalDigit = hexDigitToDecimal($currentDigit);
        if ($decimalDigit == -1) {
            echo "Invalid hexadecimal number.\n";
            return -1;
        }
        $decimalValue += $decimalDigit * $power;
        $power *= 16; // Increase power of 16
    }

    return $decimalValue;
}

// Main program execution starts here
echo "Enter a hexadecimal number: ";
$hexInput = trim(fgets(STDIN)); // Read user input

// Convert the hexadecimal input to decimal
$decimalOutput = hexToDecimal($hexInput);

// Output the result
if ($decimalOutput != -1) {
    echo "The decimal equivalent of hexadecimal $hexInput is $decimalOutput.\n";
}

