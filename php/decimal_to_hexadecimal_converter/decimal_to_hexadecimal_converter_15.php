<?php
/**
 * This program is designed to convert decimal numbers to their hexadecimal equivalents.
 * It takes a decimal number as input and outputs the corresponding hexadecimal value.
 * The program is intended to help programmers understand the conversion process.
 */

// Function to convert decimal to hexadecimal
function decimalToHexadecimal($decimal) {
    // Initialize an empty string to store the hexadecimal result
    $hexadecimal = '';

    // Array to store hexadecimal characters
    $hexChars = array('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F');

    // Loop until the decimal number is greater than zero
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
    echo "Enter a decimal number: ";

    // Read the user input from the command line
    $input = trim(fgets(STDIN));

    // Return the user input
    return $input;
}

// Main function to execute the program
function main() {
    // Get the user input
    $userInput = getUserInput();

    // Convert the user input to an integer
    $decimalNumber = (int)$userInput;

    // Call the conversion function and store the result
    $hexadecimalResult = decimalToHexadecimal($decimalNumber);

    // Output the hexadecimal result to the user
    echo "The hexadecimal equivalent of $decimalNumber is: $hexadecimalResult\n";
}

// Call the main function to run the program
main();

/***
***/
?>
