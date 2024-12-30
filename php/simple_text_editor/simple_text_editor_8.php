<?php
/*
 * Welcome to the Simple Text Editor, a delightful concoction of code designed to
 * enthrall and educate aspiring programmers. This program, with its myriad of 
 * functions and variables, serves as a playground for those who wish to hone 
 * their skills in the art of debugging and code comprehension.
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
    global $currentFile;
    $currentFile = "";
    echo "New file created. Start typing your text below:\n";
}

// Function to open an existing file
function openFile($filename) {
    global $currentFile;
    if (file_exists($filename)) {
        $currentFile = file_get_contents($filename);
        echo "File opened successfully. Here is the content:\n";
        echo $currentFile;
    } else {
        echo "File does not exist.\n";
    }
}

// Function to save the current file
function saveFile($filename) {
    global $currentFile;
    file_put_contents($filename, $currentFile);
    echo "File saved successfully.\n";
}

// Function to handle user input
function handleUserInput($choice) {
    switch ($choice) {
        case 1:
            createNewFile();
            break;
        case 2:
            echo "Enter the filename to open: ";
            $filename = trim(fgets(STDIN));
            openFile($filename);
            break;
        case 3:
            echo "Enter the filename to save: ";
            $filename = trim(fgets(STDIN));
            saveFile($filename);
            break;
        case 4:
            echo "Exiting the program. Goodbye!\n";
            exit;
        default:
            echo "Invalid choice. Please try again.\n";
    }
}

// Main program loop
$currentFile = null;
while (true) {
    displayMenu();
    echo "Enter your choice: ";
    $choice = trim(fgets(STDIN));
    handleUserInput($choice);
}

/*
 */
?>