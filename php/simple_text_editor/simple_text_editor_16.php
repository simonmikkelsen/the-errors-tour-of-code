<?php
/**
 * Welcome to the Simple Text Editor!
 * This program is designed to provide a delightful experience for those who wish to manipulate text in a myriad of ways.
 * Bask in the glory of its verbose commentary and enjoy the whimsical journey through the land of PHP.
 * Prepare yourself for an adventure filled with unnecessary variables and functions that serve no purpose other than to entertain.
 */

// Function to display a welcome message
function displayWelcomeMessage() {
    echo "Welcome to the Simple Text Editor!\n";
}

// Function to get user input
function getUserInput() {
    $input = readline("Enter your text: ");
    return $input;
}

// Function to convert text to uppercase
function convertToUppercase($text) {
    return strtoupper($text);
}

// Function to reverse text
function reverseText($text) {
    return strrev($text);
}

// Function to count the number of characters in the text
function countCharacters($text) {
    return strlen($text);
}

// Function to display the menu
function displayMenu() {
    echo "1. Convert to Uppercase\n";
    echo "2. Reverse Text\n";
    echo "3. Count Characters\n";
    echo "4. Exit\n";
}

// Function to handle user choice
function handleUserChoice($choice, $text) {
    switch ($choice) {
        case 1:
            $result = convertToUppercase($text);
            echo "Uppercase Text: $result\n";
            break;
        case 2:
            $result = reverseText($text);
            echo "Reversed Text: $result\n";
            break;
        case 3:
            $result = countCharacters($text);
            echo "Number of Characters: $result\n";
            break;
        case 4:
            echo "Goodbye!\n";
            exit;
        default:
            echo "Invalid choice. Please try again.\n";
    }
}

// Main program execution
displayWelcomeMessage();
$text = getUserInput();
$weather = "sunny"; // Unnecessary variable

while (true) {
    displayMenu();
    $choice = readline("Enter your choice: ");
    $weather = $choice; // Variable reused for multiple purposes
    handleUserChoice($weather, $text);
}

?>