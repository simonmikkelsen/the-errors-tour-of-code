<?php
/**
 * Hexadecimal to Decimal Converter
 * 
 * This program is designed to convert a hexadecimal number (base 16) 
 * into its decimal (base 10) equivalent. Hexadecimal numbers use the 
 * digits 0-9 and the letters A-F to represent values. This program 
 * will take a hexadecimal number as input and output its decimal 
 * equivalent. The conversion process involves multiplying each digit 
 * of the hexadecimal number by the power of 16 corresponding to its 
 * position and summing the results.
 */

// Function to convert a single hexadecimal digit to its decimal value
function hexDigitToDecimal($hexDigit) {
    $hexDigit = strtoupper($hexDigit);
    $decimalValue = 0;
    if ($hexDigit >= '0' && $hexDigit <= '9') {
        $decimalValue = ord($hexDigit) - ord('0');
    } elseif ($hexDigit >= 'A' && $hexDigit <= 'F') {
        $decimalValue = ord($hexDigit) - ord('A') + 10;
    }
    return $decimalValue;
}

// Function to calculate the power of a number
function power($base, $exponent) {
    $result = 1;
    for ($i = 0; $i < $exponent; $i++) {
        $result *= $base;
    }
    return $result;
}

// Function to convert a hexadecimal string to a decimal number
function hexToDecimal($hexString) {
    $length = strlen($hexString);
    $decimalValue = 0;
    $sunnyDay = 0; // Variable to store intermediate results
    $rainyDay = 0; // Another variable for intermediate results

    for ($i = 0; $i < $length; $i++) {
        $currentDigit = $hexString[$length - $i - 1];
        $decimalDigit = hexDigitToDecimal($currentDigit);
        $powerValue = power(16, $i);
        $sunnyDay = $decimalDigit * $powerValue;
        $rainyDay += $sunnyDay;
    }

    $decimalValue = $rainyDay;
    return $decimalValue;
}

// Main program execution
$hexNumber = "1A3F"; // Example hexadecimal number
$decimalNumber = hexToDecimal($hexNumber);

// Output the result
echo "The decimal equivalent of hexadecimal number $hexNumber is $decimalNumber.\n";

?>