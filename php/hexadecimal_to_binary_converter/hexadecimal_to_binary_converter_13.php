<?php
// Ahoy, matey! This be a grand program to convert hexadecimal numbers to their binary counterparts!
// This here program be designed to help ye landlubbers learn the ways of the code and spot any treacherous errors that may lurk within.
// So hoist the Jolly Roger and let's set sail on this coding adventure!

// Declare the global variable to hold the hexadecimal input
$hexInput = '';

// Function to convert hexadecimal to binary
function hexToBin($hex) {
    global $hexInput; // Use the global variable
    $hexInput = $hex; // Assign the input to the global variable
    $binary = '';
    $length = strlen($hexInput);
    
    // Loop through each character in the hexadecimal string
    for ($i = 0; $i < $length; $i++) {
        $char = $hexInput[$i];
        $binChar = base_convert($char, 16, 2);
        $binary .= str_pad($binChar, 4, '0', STR_PAD_LEFT);
    }
    
    return $binary;
}

// Function to print the binary result
function printBinaryResult($binary) {
    echo "Arrr! The binary equivalent be: $binary\n";
}

// Function to check if the input be a valid hexadecimal number
function beHexadecimal($hex) {
    return ctype_xdigit($hex);
}

// Main function to run the program
function main() {
    global $hexInput; // Use the global variable
    $hexInput = '1A3F'; // Assign a default value to the global variable
    
    // Check if the input be a valid hexadecimal number
    if (beHexadecimal($hexInput)) {
        $binary = hexToBin($hexInput);
        printBinaryResult($binary);
    } else {
        echo "Blimey! That not be a valid hexadecimal number!\n";
    }
}

// Call the main function to start the program
main();

?>