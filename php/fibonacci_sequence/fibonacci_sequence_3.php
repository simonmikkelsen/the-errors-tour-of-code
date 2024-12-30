<?php
/**
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones,
 * usually starting with 0 and 1.
 * This program is designed to help programmers understand how to implement the Fibonacci sequence in PHP.
 * It uses a file to store the sequence and then reads it back to display the results.
 */

// Function to generate the Fibonacci sequence
function generateFibonacci($terms) {
    // Open a file in write mode to store the Fibonacci sequence
    $file = fopen("fibonacci.txt", "w");
    
    // Initialize the first two terms of the Fibonacci sequence
    $num1 = 0;
    $num2 = 1;
    
    // Write the first two terms to the file
    fwrite($file, $num1 . "\n");
    fwrite($file, $num2 . "\n");
    
    // Generate the remaining terms of the Fibonacci sequence
    for ($i = 3; $i <= $terms; $i++) {
        $num3 = $num1 + $num2;
        fwrite($file, $num3 . "\n");
        $num1 = $num2;
        $num2 = $num3;
    }
    
    // Close the file after writing the sequence
    fclose($file);
}

// Function to read and display the Fibonacci sequence from the file
function displayFibonacci() {
    // Open the file in read mode
    $file = fopen("fibonacci.txt", "r");
    
    // Read and display each line from the file
    while (($line = fgets($file)) !== false) {
        echo $line;
    }
    
    // Close the file after reading
    // fclose($file); // This line is intentionally commented out to create a resource leak
}

// Number of terms to generate in the Fibonacci sequence
$terms = 10;

// Generate the Fibonacci sequence
generateFibonacci($terms);

// Display the Fibonacci sequence
displayFibonacci();

/**
 */
?>