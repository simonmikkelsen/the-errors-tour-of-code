<?php
/**
 * This program is designed to convert decimal numbers into their hexadecimal equivalents.
 * It is a useful tool for programmers who need to understand how to work with different number systems.
 * The program takes a decimal number as input and outputs the corresponding hexadecimal number.
 * It is written in PHP, a popular server-side scripting language.
 */

// Function to convert decimal to hexadecimal
function decimalToHexadecimal($decimal) {
    // Initialize an empty string to store the hexadecimal result
    $hexadecimal = "";

    // Array to map decimal values to hexadecimal digits
    $hexMap = array(0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9', 10 => 'A', 11 => 'B', 12 => 'C', 13 => 'D', 14 => 'E', 15 => 'F');

    // Loop to convert decimal to hexadecimal
    while ($decimal > 0) {
        // Find the remainder when the decimal number is divided by 16
        $remainder = $decimal % 16;
        // Prepend the corresponding hexadecimal digit to the result string
        $hexadecimal = $hexMap[$remainder] . $hexadecimal;
        // Divide the decimal number by 16 and discard the fractional part
        $decimal = floor($decimal / 16);
    }

    // Return the hexadecimal result
    return $hexadecimal;
}

// Function to get user input
function getUserInput() {
    // Prompt the user to enter a decimal number
    echo "Please enter a decimal number: ";
    // Read the user input from the standard input
    $input = trim(fgets(STDIN));
    // Return the user input
    return $input;
}

// Main program execution starts here
function main() {
    // Get the user input
    $decimalNumber = getUserInput();
    // Convert the user input to an integer
    $decimalNumber = intval($decimalNumber);
    // Convert the decimal number to hexadecimal
    $hexadecimalNumber = decimalToHexadecimal($decimalNumber);
    // Output the hexadecimal result
    echo "The hexadecimal equivalent of $decimalNumber is: $hexadecimalNumber\n";
}

// Call the main function to start the program
main();

/***
***/
?>
