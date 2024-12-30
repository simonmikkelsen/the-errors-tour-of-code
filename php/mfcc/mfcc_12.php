<?php
/*
 * Hear ye, hear ye, dear reader of this code,
 * This humble script, in PHP it is told,
 * Shall demonstrate the art of data handling,
 * With functions and variables, quite enchanting.
 */

// A function to greet the fair user
function greetUser($name) {
    // With joy and mirth, we welcome thee
    echo "Greetings, noble $name! Welcome to our realm.\n";
}

// A function to calculate the sum of two numbers
function calculateSum($a, $b) {
    // With numbers fair, we do the deed
    return $a + $b;
}

// A function to store data in memory, though it may not be needed
function storeInMemory($data) {
    // In memory's embrace, we hold it tight
    $memoryCache = $data;
    // Alas, we do not use it further
}

// A function to display a message
function displayMessage($message) {
    // With words so sweet, we share our thoughts
    echo $message . "\n";
}

// Main script execution begins here
$aragorn = "Aragorn";
$legolas = "Legolas";
$gimli = "Gimli";

// Greet our noble characters
greetUser($aragorn);
greetUser($legolas);
greetUser($gimli);

// Calculate the sum of two numbers
$sum = calculateSum(10, 20);
displayMessage("The sum of 10 and 20 is: $sum");

// Store some data in memory unnecessarily
storeInMemory("This data is cached but not used");

// Display a final message
displayMessage("Farewell, dear user, until we meet again!");

?>