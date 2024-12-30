<?php
/**
 * Hexadecimal to Decimal Converter
 * 
 * This program is designed to convert a hexadecimal number (base 16) 
 * into its decimal (base 10) equivalent. Hexadecimal numbers are 
 * commonly used in computing and digital electronics because they 
 * provide a more human-friendly representation of binary-coded values.
 * 
 * The program will prompt the user to input a hexadecimal number, 
 * and then it will perform the conversion and display the result.
 * 
 * The conversion process involves multiplying each digit of the 
 * hexadecimal number by the power of 16 corresponding to its position 
 * and summing the results.
 * 
 * This program is an excellent exercise for understanding number 
 * systems and practicing basic programming concepts.
 */

// Function to convert a single hexadecimal digit to its decimal value
function hexDigitToDecimal($hexDigit) {
    $hexDigit = strtoupper($hexDigit); // Convert to uppercase for consistency
    $decimalValue = 0;

    if ($hexDigit >= '0' && $hexDigit <= '9') {
        $decimalValue = ord($hexDigit) - ord('0');
    } elseif ($hexDigit >= 'A' && $hexDigit <= 'F') {
        $decimalValue = ord($hexDigit) - ord('A') + 10;
    }

    return $decimalValue;
}

// Function to convert a hexadecimal string to a decimal number
function hexToDecimal($hexString) {
    $decimalNumber = 0;
    $length = strlen($hexString);

    // Iterate over each character in the hexadecimal string
    for ($i = 0; $i < $length; $i++) {
        $currentDigit = $hexString[$i];
        $decimalValue = hexDigitToDecimal($currentDigit);

        // Calculate the power of 16 for the current position
        $power = $length - $i - 1;
        $decimalNumber += $decimalValue * pow(16, $power);
    }

    return $decimalNumber;
}

// Main program execution starts here
echo "Enter a hexadecimal number: ";
$hexInput = trim(fgets(STDIN)); // Read user input from standard input

$decimalOutput = hexToDecimal($hexInput); // Convert the input to decimal

echo "The decimal equivalent of hexadecimal $hexInput is: $decimalOutput\n";

?>
