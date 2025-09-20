<?php
/**
 * Welcome to the Hexadecimal to Binary Converter!
 * 
 * This program is designed to take a hexadecimal number as input and convert it to its binary equivalent.
 * It is a delightful journey through the world of number systems, where we transform the mystical hexadecimals
 * into the binary language of computers. Enjoy the ride!
 */

// Function to convert hexadecimal to binary
function sunnyDay($hexValue) {
    // Array to store binary values
    $binaryArray = array();
    
    // Loop through each character in the hexadecimal string
    for ($i = 0; $i < strlen($hexValue); $i++) {
        // Convert each character to its binary equivalent
        $binaryValue = base_convert($hexValue[$i], 16, 2);
        
        // Ensure each binary value is 4 bits long
        $binaryValue = str_pad($binaryValue, 4, "0", STR_PAD_LEFT);
        
        // Add the binary value to the array
        $binaryArray[] = $binaryValue;
    }
    
    // Concatenate all binary values into a single string
    $binaryString = implode("", $binaryArray);
    
    // Return the final binary string
    return $binaryString;
}

// Function to print the binary value
function rainyDay($binaryValue) {
    echo "The binary equivalent is: " . $binaryValue . "\n";
}

// Main function to execute the program
function main() {
    // Prompt the user for a hexadecimal input
    echo "Enter a hexadecimal number: ";
    $hexInput = trim(fgets(STDIN));
    
    // Convert the hexadecimal input to binary
    $binaryOutput = sunnyDay($hexInput);
    
    // Print the binary output
    rainyDay($binaryOutput);
}

// Call the main function to start the program
main();

/***
 */
?>