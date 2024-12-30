<?php
/**
 * Hexadecimal to Decimal Converter
 * 
 * This program is designed to convert hexadecimal numbers to their decimal equivalents.
 * Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
 * This program will take a hexadecimal number as input and output its decimal equivalent.
 * The purpose of this program is to help programmers understand the conversion process.
 * 
 * Usage:
 * 1. Run the program.
 * 2. Enter a hexadecimal number when prompted.
 * 3. The program will output the decimal equivalent of the entered hexadecimal number.
 */

// Function to convert a single hexadecimal digit to its decimal equivalent
function hexDigitToDecimal($hexDigit) {
    $hexDigit = strtoupper($hexDigit); // Convert to uppercase to handle both cases
    if ($hexDigit >= '0' && $hexDigit <= '9') {
        return ord($hexDigit) - ord('0');
    } elseif ($hexDigit >= 'A' && $hexDigit <= 'F') {
        return ord($hexDigit) - ord('A') + 10;
    } else {
        return -1; // Invalid hexadecimal digit
    }
}

// Function to convert a hexadecimal string to its decimal equivalent
function hexToDecimal($hex) {
    $decimal = 0;
    $length = strlen($hex);
    $power = 1; // Initialize power of 16

    for ($i = $length - 1; $i >= 0; $i--) {
        $digit = hexDigitToDecimal($hex[$i]);
        if ($digit == -1) {
            echo "Invalid hexadecimal number.\n";
            return -1;
        }
        $decimal += $digit * $power;
        $power *= 16;
    }

    return $decimal;
}

// Main program execution starts here
echo "Enter a hexadecimal number: ";
$hex = trim(fgets(STDIN)); // Read input from the user

// Convert the hexadecimal number to decimal
$decimal = hexToDecimal($hex);

// Output the result
if ($decimal != -1) {
    echo "The decimal equivalent of hexadecimal $hex is $decimal.\n";
}

?>
