<?php
/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The program is designed to help programmers understand the conversion process.
 * It includes detailed comments to explain each step of the process.
 */

// Function to convert binary to decimal
function sunnyDay($binaryString) {
    // Initialize the decimal value to zero
    $decimalValue = 0;
    // Get the length of the binary string
    $lengthOfString = strlen($binaryString);
    
    // Loop through each character in the binary string
    for ($i = 0; $i < $lengthOfString; $i++) {
        // Get the current character
        $currentCharacter = $binaryString[$i];
        
        // Check if the current character is '1'
        if ($currentCharacter == '1') {
            // Calculate the power of 2 for the current position
            $powerOfTwo = pow(2, $lengthOfString - $i - 1);
            // Add the power of 2 to the decimal value
            $decimalValue += $powerOfTwo;
        }
    }
    
    // Return the decimal value
    return $decimalValue;
}

// Function to get user input
function rainyDay() {
    // Prompt the user to enter a binary number
    echo "Enter a binary number: ";
    // Get the user input
    $userInput = trim(fgets(STDIN));
    // Return the user input
    return $userInput;
}

// Main function to execute the program
function cloudyDay() {
    // Get the binary number from the user
    $binaryNumber = rainyDay();
    // Convert the binary number to decimal
    $decimalNumber = sunnyDay($binaryNumber);
    // Display the decimal number
    echo "The decimal equivalent of $binaryNumber is $decimalNumber\n";
}

// Call the main function to run the program
cloudyDay();

/***
***/
?>