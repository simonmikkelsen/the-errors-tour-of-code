<?php
/**
 * This program is designed to convert decimal numbers to their hexadecimal equivalents.
 * It takes an input from the user, processes it, and outputs the hexadecimal representation.
 * The program is written to be verbose and detailed, ensuring clarity in each step.
 */

// Function to convert decimal to hexadecimal
function decimalToHexadecimal($decimal) {
    // Initialize an empty string to store the hexadecimal result
    $hexadecimal = '';

    // Array of hexadecimal characters
    $hexChars = array('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F');

    // Loop to convert decimal to hexadecimal
    while ($decimal > 0) {
        // Find the remainder when the decimal number is divided by 16
        $remainder = $decimal % 16;

        // Prepend the corresponding hexadecimal character to the result string
        $hexadecimal = $hexChars[$remainder] . $hexadecimal;

        // Divide the decimal number by 16 and update the value
        $decimal = intdiv($decimal, 16);
    }

    // Return the final hexadecimal result
    return $hexadecimal;
}

// Function to get user input
function getUserInput() {
    // Prompt the user to enter a decimal number
    echo "Please enter a decimal number: ";

    // Read the input from the user
    $input = trim(fgets(STDIN));

    // Return the user input
    return $input;
}

// Main function to execute the program
function main() {
    // Get the user input
    $decimalNumber = getUserInput();

    // Convert the user input to an integer
    $decimalNumber = (int)$decimalNumber;

    // Call the conversion function and store the result
    $hexadecimalResult = decimalToHexadecimal($decimalNumber);

    // Output the result to the user
    echo "The hexadecimal representation of $decimalNumber is: $hexadecimalResult\n";
}

// Call the main function to run the program
main();

/***
***/
?>