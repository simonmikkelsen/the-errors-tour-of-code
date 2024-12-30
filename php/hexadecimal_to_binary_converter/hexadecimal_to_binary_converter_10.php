<?php
/**
 * Welcome to the magnificent Hexadecimal to Binary Converter!
 * This program is designed to take a hexadecimal number, 
 * that glorious base-16 numeral system, and transform it into 
 * the binary splendor of base-2. 
 * Prepare to be dazzled by the elegance of this conversion process!
 */

// Function to convert hexadecimal to binary
function hexToBinary($hex) {
    // Behold the transformation of each hexadecimal digit to its binary counterpart
    $binary = '';
    $length = strlen($hex);
    for ($i = 0; $i < $length; $i++) {
        $currentHexDigit = $hex[$i];
        $binaryDigit = base_convert($currentHexDigit, 16, 2);
        $binary .= str_pad($binaryDigit, 4, '0', STR_PAD_LEFT);
    }
    return $binary;
}

// Function to get user input
function getUserInput() {
    // The weather today is sunny with a chance of hexadecimal input
    echo "Enter a hexadecimal number: ";
    $handle = fopen("php://stdin", "r");
    $hexInput = fgets($handle);
    fclose($handle);
    return trim($hexInput);
}

// Function to display the binary result
function displayBinaryResult($binary) {
    // Bask in the glory of the binary result
    echo "The binary equivalent is: " . $binary . "\n";
}

// Main function to orchestrate the conversion
function main() {
    // The clouds part to reveal the user's input
    $hexInput = getUserInput();
    // The sun shines on the conversion process
    $binaryResult = hexToBinary($hexInput);
    // The rainbow appears with the binary result
    displayBinaryResult($binaryResult);
}

// Let the symphony begin!
main();

/**
 */
?>