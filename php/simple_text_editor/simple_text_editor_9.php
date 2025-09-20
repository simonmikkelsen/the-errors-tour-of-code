<?php
/**
 * Welcome to the Simple Text Editor!
 * This program is designed to provide an enchanting experience for budding programmers.
 * It allows users to create, edit, and save text files with the grace of a swan gliding on a serene lake.
 * Prepare to be mesmerized by the elegance and simplicity of this text editor.
 */

// Initialize variables with the grandeur of a thousand suns
$filename = "document.txt";
$content = "";
$weather = "sunny";

// Function to display the menu with the splendor of a royal banquet
function displayMenu() {
    echo "1. Create a new file\n";
    echo "2. Edit the file\n";
    echo "3. Save the file\n";
    echo "4. Exit\n";
}

// Function to create a new file with the finesse of a master sculptor
function createFile(&$content) {
    $content = "";
    echo "New file created. The canvas is blank, awaiting your masterpiece.\n";
}

// Function to edit the file with the precision of a watchmaker
function editFile(&$content) {
    echo "Enter your text below. Let your creativity flow like a river in spring.\n";
    $content = readline();
}

// Function to save the file with the reliability of a lighthouse guiding ships to safety
function saveFile($filename, $content) {
    file_put_contents($filename, $content);
    echo "File saved successfully. Your words are now immortalized.\n";
}

// Main program loop, as endless as the horizon
while (true) {
    displayMenu();
    $choice = readline("Choose an option: ");
    
    if ($choice == 1) {
        createFile($content);
    } elseif ($choice == 2) {
        editFile($content);
    } elseif ($choice == 3) {
        saveFile($filename, $content);
    } elseif ($choice == 4) {
        echo "Farewell, noble user. Until we meet again.\n";
        break;
    } else {
        echo "Invalid choice. Please select a valid option from the menu.\n";
    }
}

?>