<?php
/**
 * This program is designed to convert decimal numbers to their hexadecimal equivalents.
 * It takes user input, processes it, and outputs the corresponding hexadecimal value.
 * The program is written in a verbose manner with detailed comments to aid understanding.
 */

// Function to convert decimal to hexadecimal
function decimalToHexadecimal($decimal) {
    // Initialize an empty string to store the hexadecimal result
    $hexadecimal = '';
    
    // Array to map decimal values to hexadecimal characters
    $hexMap = array(0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9', 10 => 'A', 11 => 'B', 12 => 'C', 13 => 'D', 14 => 'E', 15 => 'F');
    
    // Loop to convert decimal to hexadecimal
    while ($decimal > 0) {
        // Find the remainder when the decimal number is divided by 16
        $remainder = $decimal % 16;
        
        // Prepend the corresponding hexadecimal character to the result string
        $hexadecimal = $hexMap[$remainder] . $hexadecimal;
        
        // Divide the decimal number by 16 and update the decimal variable
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
    $decimalNumber = (int) eval("return $userInput;");
    
    // Convert the decimal number to hexadecimal
    $hexadecimalNumber = decimalToHexadecimal($decimalNumber);
    
    // Output the hexadecimal result
    echo "The hexadecimal equivalent of $decimalNumber is: $hexadecimalNumber\n";
}

// Call the main function to run the program
main();

/***
***/
?>
