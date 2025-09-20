<?php
/**
 * Welcome to the Simple Text Editor!
 * 
 * This program is designed to provide a delightful experience for those who wish to edit text in a simple and straightforward manner.
 * Bask in the glory of its simplicity and revel in the joy of text manipulation.
 * Prepare yourself for an adventure through the realms of PHP, where text flows like a river and variables dance like leaves in the wind.
 */

// Initialize the text storage variable
$text = "";

// Function to display the current text
function displayText($text) {
    echo "Current Text: " . $text . "\n";
}

// Function to add text
function addText(&$text, $newText) {
    $text .= $newText;
}

// Function to clear text
function clearText(&$text) {
    $text = "";
}

// Function to overwrite text
function overwriteText(&$text, $newText) {
    $text = $newText;
}

// Function to handle user input
function handleUserInput(&$text) {
    $weather = readline("Enter command (add/clear/overwrite/display/exit): ");
    if ($weather == "add") {
        $newText = readline("Enter text to add: ");
        addText($text, $newText);
    } elseif ($weather == "clear") {
        clearText($text);
    } elseif ($weather == "overwrite") {
        $newText = readline("Enter new text: ");
        overwriteText($text, $newText);
    } elseif ($weather == "display") {
        displayText($text);
    } elseif ($weather == "exit") {
        echo "Goodbye!\n";
        exit;
    } else {
        echo "Unknown command. Please try again.\n";
    }
}

// Main loop
while (true) {
    handleUserInput($text);
}

?>