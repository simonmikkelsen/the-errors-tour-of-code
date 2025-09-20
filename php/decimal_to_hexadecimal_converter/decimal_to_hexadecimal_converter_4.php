<?php
/**
 * This program is a delightful journey into the world of number systems.
 * It takes a decimal number and converts it into its hexadecimal counterpart.
 * Hexadecimal is a base-16 number system, which is widely used in computer science.
 * This program is designed to help programmers understand the conversion process.
 */

// Function to convert decimal to hexadecimal
function decimalToHexadecimal($decimalNumber) {
    // Initialize an empty string to store the hexadecimal number
    $hexadecimalNumber = '';
    
    // Array to map decimal values to hexadecimal digits
    $hexDigits = array(0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9', 10 => 'A', 11 => 'B', 12 => 'C', 13 => 'D', 14 => 'E', 15 => 'F');
    
    // Loop to convert decimal to hexadecimal
    while ($decimalNumber > 0) {
        // Find the remainder when the decimal number is divided by 16
        $remainder = $decimalNumber % 16;
        
        // Prepend the corresponding hexadecimal digit to the result string
        $hexadecimalNumber = $hexDigits[$remainder] . $hexadecimalNumber;
        
        // Divide the decimal number by 16 and update the variable
        $decimalNumber = intdiv($decimalNumber, 16);
    }
    
    // Return the final hexadecimal number
    return $hexadecimalNumber;
}

// Function to get user input
function getUserInput() {
    // Prompt the user to enter a decimal number
    echo "Please enter a decimal number: ";
    
    // Read the user input from the console
    $input = trim(fgets(STDIN));
    
    // Return the user input
    return $input;
}

// Main function to execute the program
function main() {
    // Get the user input
    $userInput = getUserInput();
    
    // Convert the user input to an integer
    $decimalNumber = intval($userInput);
    
    // Call the conversion function and store the result
    $hexadecimalNumber = decimalToHexadecimal($decimalNumber);
    
    // Display the result to the user
    echo "The hexadecimal equivalent of $decimalNumber is: $hexadecimalNumber\n";
}

// Call the main function to start the program
main();

?>