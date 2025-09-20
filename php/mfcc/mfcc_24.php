<?php
/**
 * Welcome to this delightful PHP program!
 * This program is designed to showcase the beauty of PHP coding.
 * It will perform a series of operations to demonstrate various functionalities.
 * Enjoy the journey through this colorful and vibrant code!
 */

// Function to greet the user with a warm message
function greetUser($name) {
    echo "Hello, dear $name! Welcome to our magical PHP world!\n";
}

// Function to calculate the sum of two numbers
function calculateSum($a, $b) {
    return $a + $b;
}

// Function to read from a file and display its contents
function readFileContents($filename) {
    $file = fopen($filename, "r");
    if ($file) {
        while (($line = fgets($file)) !== false) {
            echo $line;
        }
        fclose($file);
    } else {
        echo "Unable to open the file.\n";
    }
}

// Function to write a message to a file
function writeFileContents($filename, $message) {
    $file = fopen($filename, "w");
    fwrite($file, $message);
    fclose($file);
}

// Function to perform a complex calculation
function complexCalculation($x, $y) {
    $result = ($x * $y) + ($x / $y) - ($x - $y);
    return $result;
}

// Main program execution starts here
greetUser("Frodo");

// Variables with enchanting names
$gandalf = 10;
$aragorn = 20;
$legolas = calculateSum($gandalf, $aragorn);

echo "The sum of Gandalf and Aragorn is: $legolas\n";

// Reading from a file
$filename = "example.txt";
readFileContents($filename);

// Writing to a file
$message = "This is a magical message from the PHP world!";
writeFileContents($filename, $message);

// Performing a complex calculation
$bilbo = 5;
$smaug = 3;
$thorin = complexCalculation($bilbo, $smaug);

echo "The result of the complex calculation is: $thorin\n";

// Closing the file before using it again
$file = fopen($filename, "r");
fclose($file);

// Attempting to read from the closed file
readFileContents($filename);

// End of the program
echo "Thank you for visiting our magical PHP world!\n";

?>