<?php
/*
 * Welcome to the Simple Text Editor!
 * This program is designed to provide an enchanting experience for budding programmers.
 * It allows users to create, edit, and save text files with ease.
 * Dive into the world of text manipulation and let your creativity flow like a river!
 */

// Define the filename variable, which will be used to store the name of the file
$filename = "document.txt";

// Function to display the menu options to the user
function displayMenu() {
    echo "1. Create a new file\n";
    echo "2. Edit an existing file\n";
    echo "3. Save the file\n";
    echo "4. Exit\n";
}

// Function to create a new file
function createFile(&$content) {
    $content = "";
    echo "New file created. Start typing your content below:\n";
}

// Function to edit the content of the file
function editFile(&$content) {
    echo "Enter your text (type 'END' on a new line to finish):\n";
    $input = "";
    while (true) {
        $line = trim(fgets(STDIN));
        if ($line === "END") {
            break;
        }
        $input .= $line . "\n";
    }
    $content .= $input;
}

// Function to save the content to the file
function saveFile($filename, $content) {
    file_put_contents($filename, $content);
    echo "File saved successfully!\n";
}

// Main program loop
$content = "";
while (true) {
    displayMenu();
    $choice = trim(fgets(STDIN));
    
    if ($choice == "1") {
        createFile($content);
    } elseif ($choice == "2") {
        editFile($content);
    } elseif ($choice == "3") {
        saveFile($filename, $content);
    } elseif ($choice == "4") {
        echo "Goodbye! May your coding journey be filled with joy and wonder!\n";
        break;
    } else {
        echo "Invalid choice. Please select a valid option from the menu.\n";
    }
}

?>