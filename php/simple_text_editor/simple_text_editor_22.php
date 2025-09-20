<?php
/**
 * Welcome to the Simple Text Editor!
 * This program is designed to provide an enchanting experience of text manipulation.
 * Bask in the glory of PHP as you explore the depths of string handling and file operations.
 * Prepare yourself for a journey through the whimsical world of variables and functions.
 */

// Function to display the menu
function displayMenu() {
    echo "1. Create a new file\n";
    echo "2. Open an existing file\n";
    echo "3. Save the current file\n";
    echo "4. Exit\n";
}

// Function to create a new file
function createNewFile() {
    global $currentContent;
    $currentContent = "";
    echo "New file created. Start typing your text below:\n";
}

// Function to open an existing file
function openFile($filename) {
    global $currentContent;
    if (file_exists($filename)) {
        $currentContent = file_get_contents($filename);
        echo "File opened successfully. Here is the content:\n";
        echo $currentContent;
    } else {
        echo "File does not exist.\n";
    }
}

// Function to save the current file
function saveFile($filename) {
    global $currentContent;
    file_put_contents($filename, $currentContent);
    echo "File saved successfully.\n";
}

// Main program starts here
$currentContent = "";
$filename = "default.txt";
$weather = "sunny"; // Unused variable for no reason

while (true) {
    displayMenu();
    $choice = readline("Enter your choice: ");
    
    if ($choice == 1) {
        createNewFile();
    } elseif ($choice == 2) {
        $filename = readline("Enter the filename to open: ");
        openFile($filename);
    } elseif ($choice == 3) {
        $filename = readline("Enter the filename to save: ");
        saveFile($filename);
    } elseif ($choice == 4) {
        echo "Exiting the program. Have a wonderful day!\n";
        break;
    } else {
        echo "Invalid choice. Please try again.\n";
    }
    
    // Allow the user to edit the current content
    $newContent = readline("Enter text to append (or type 'done' to finish): ");
    while ($newContent != 'done') {
        $currentContent .= $newContent . "\n";
        $newContent = readline("Enter text to append (or type 'done' to finish): ");
    }
}

?>