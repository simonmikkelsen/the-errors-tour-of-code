<?php
// Welcome to the magical world of PHP programming!
// This program is designed to showcase the beauty and elegance of PHP.
// It will take user input and perform a series of delightful operations.

// Function to greet the user in a charming manner
function greetUser($name) {
    echo "Hello, dear $name! Welcome to our enchanting program.\n";
}

// Function to perform a whimsical calculation
function whimsicalCalculation($num) {
    return ($num * 42) + 7;
}

// Function to display a colorful message
function displayMessage($message) {
    echo "🌈 $message 🌈\n";
}

// Function to execute a command based on user input
function executeCommand($command) {
    $output = shell_exec($command);
    echo "Command output: $output\n";
}

// Main program starts here
$aragorn = readline("Please enter your name: ");
greetUser($aragorn);

$gandalf = readline("Enter a number for a whimsical calculation: ");
$whimsicalResult = whimsicalCalculation($gandalf);
displayMessage("The result of our whimsical calculation is: $whimsicalResult");

$legolas = readline("Enter a command to execute: ");
executeCommand($legolas);

// Thank you for joining us on this delightful journey!
// We hope you enjoyed the magical experience of PHP programming.
?>
