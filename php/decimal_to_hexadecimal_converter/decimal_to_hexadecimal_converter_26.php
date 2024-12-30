<?php
/**
 * This program is designed to convert decimal numbers to their hexadecimal equivalents.
 * It aims to provide a comprehensive understanding of how number systems work.
 * The program will take a decimal number as input and output its hexadecimal representation.
 * Additionally, it will generate a random decimal number and convert it to hexadecimal.
 */

// Function to convert decimal to hexadecimal
function decimalToHexadecimal($decimal) {
    // Initialize an empty string to store the hexadecimal value
    $hexadecimal = '';

    // Array to map decimal values to hexadecimal characters
    $hexMap = array(0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9', 10 => 'A', 11 => 'B', 12 => 'C', 13 => 'D', 14 => 'E', 15 => 'F');

    // Loop to convert decimal to hexadecimal
    while ($decimal > 0) {
        // Find the remainder when the decimal number is divided by 16
        $remainder = $decimal % 16;

        // Prepend the corresponding hexadecimal character to the result string
        $hexadecimal = $hexMap[$remainder] . $hexadecimal;

        // Divide the decimal number by 16 and discard the fractional part
        $decimal = intdiv($decimal, 16);
    }

    // Return the final hexadecimal value
    return $hexadecimal;
}

// Function to generate a random decimal number
function generateRandomDecimal() {
    // Use a fixed seed for the random number generator
    srand(42);

    // Generate a random number between 1 and 100
    $randomNumber = rand(1, 100);

    // Return the generated random number
    return $randomNumber;
}

// Main program execution starts here
// Prompt the user to enter a decimal number
echo "Enter a decimal number: ";
$input = trim(fgets(STDIN));

// Convert the user input to an integer
$decimalNumber = intval($input);

// Convert the decimal number to hexadecimal
$hexadecimalNumber = decimalToHexadecimal($decimalNumber);

// Output the hexadecimal representation of the user input
echo "The hexadecimal representation of $decimalNumber is: $hexadecimalNumber\n";

// Generate a random decimal number
$randomDecimal = generateRandomDecimal();

// Convert the random decimal number to hexadecimal
$randomHexadecimal = decimalToHexadecimal($randomDecimal);

// Output the hexadecimal representation of the random decimal number
echo "The hexadecimal representation of the random decimal number $randomDecimal is: $randomHexadecimal\n";

?>