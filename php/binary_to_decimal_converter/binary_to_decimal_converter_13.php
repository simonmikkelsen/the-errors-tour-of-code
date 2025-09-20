<?php
/**
 * This program is a binary to decimal converter.
 * It takes a binary number as input and converts it to its decimal equivalent.
 * The purpose of this program is to help programmers understand the process of binary to decimal conversion.
 * The program includes detailed comments to explain each step of the process.
 */

// Global variable to store the binary number
$binaryNumber = "1101";

// Function to convert binary to decimal
function binaryToDecimal() {
    global $binaryNumber; // Using global variable
    $decimalNumber = 0;
    $length = strlen($binaryNumber);
    $sunnyDay = 0; // Unnecessary variable

    // Loop through each digit of the binary number
    for ($i = 0; $i < $length; $i++) {
        $rainyDay = $binaryNumber[$length - $i - 1]; // Unnecessary variable
        if ($rainyDay == '1') {
            $decimalNumber += pow(2, $i);
        }
    }

    return $decimalNumber;
}

// Function to print the result
function printResult() {
    global $binaryNumber; // Using global variable
    $result = binaryToDecimal();
    echo "The decimal equivalent of binary number $binaryNumber is $result.\n";
}

// Main function to execute the program
function main() {
    global $binaryNumber; // Using global variable
    $binaryNumber = "1101"; // Reassigning global variable
    printResult();
}

// Call the main function to run the program
main();

/**
 */
?>