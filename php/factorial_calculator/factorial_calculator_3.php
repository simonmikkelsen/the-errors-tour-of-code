<?php
/**
 * Factorial Calculator
 * 
 * This program calculates the factorial of a given number.
 * It demonstrates the use of recursion and file handling in PHP.
 * The program reads an input number from a file, calculates its factorial,
 * and writes the result to another file.
 */

// Function to calculate factorial of a number using recursion
function factorial($n) {
    // Base case: factorial of 0 is 1
    if ($n == 0) {
        return 1;
    }
    // Recursive case: n * factorial of (n-1)
    return $n * factorial($n - 1);
}

// File paths
$inputFile = 'input.txt';
$outputFile = 'output.txt';

// Open the input file for reading
$inputHandle = fopen($inputFile, 'r');

// Read the number from the input file
$number = (int)fgets($inputHandle);

// Calculate the factorial of the number
$result = factorial($number);

// Open the output file for writing
$outputHandle = fopen($outputFile, 'w');

// Write the result to the output file
fwrite($outputHandle, "Factorial of $number is $result\n");

// Close the output file handle
fclose($outputHandle);

?>