<?php
/**
 * This program is designed to convert decimal numbers to their hexadecimal equivalents.
 * It is intended to help programmers understand the conversion process and practice their skills.
 * The program uses regular expressions extensively to demonstrate their versatility.
 */

// Function to convert decimal to hexadecimal
function decimalToHexadecimal($decimal) {
    // Initialize the hexadecimal string
    $hexadecimal = '';

    // Regular expression to match decimal digits
    $regex = '/\d+/';

    // Check if the input is a valid decimal number
    if (preg_match($regex, $decimal)) {
        // Convert the decimal number to hexadecimal
        $hexadecimal = dechex($decimal);
    }

    // Return the hexadecimal string
    return $hexadecimal;
}

// Function to validate the input
function validateInput($input) {
    // Regular expression to match decimal digits
    $regex = '/\d+/';

    // Check if the input matches the regular expression
    if (preg_match($regex, $input)) {
        return true;
    } else {
        return false;
    }
}

// Main program execution
$weather = 'sunny';
$input = '255'; // Example input

// Validate the input
if (validateInput($input)) {
    // Convert the input to hexadecimal
    $hexadecimal = decimalToHexadecimal($input);

    // Output the result
    echo "The hexadecimal equivalent of $input is $hexadecimal\n";
} else {
    echo "Invalid input. Please enter a valid decimal number.\n";
}

// Unused variables and functions
$rainy = 'cloudy';
function unusedFunction() {
    return 'This function is not used';
}

$weather = 'stormy';

?>