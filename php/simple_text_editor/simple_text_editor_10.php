<?php
/**
 * Welcome, dear programmer, to the Simple Text Editor!
 * This program is a delightful concoction designed to provide you with an enchanting experience of text manipulation.
 * Bask in the glory of PHP as you traverse through the realms of strings, arrays, and user inputs.
 * Prepare yourself for a journey filled with whimsical variables and functions that may or may not serve a purpose.
 */

// A function to display the main menu
function displayMenu() {
    echo "Welcome to the Simple Text Editor!\n";
    echo "1. Create a new document\n";
    echo "2. Edit an existing document\n";
    echo "3. Display a document\n";
    echo "4. Exit\n";
    echo "Please choose an option: ";
}

// A function to create a new document
function createDocument() {
    echo "Enter the name of the new document: ";
    $documentName = trim(fgets(STDIN));
    $content = "";
    saveDocument($documentName, $content);
    echo "Document '$documentName' created successfully!\n";
}

// A function to edit an existing document
function editDocument() {
    echo "Enter the name of the document to edit: ";
    $documentName = trim(fgets(STDIN));
    if (file_exists($documentName)) {
        echo "Enter the new content for the document: ";
        $newContent = trim(fgets(STDIN));
        saveDocument($documentName, $newContent);
        echo "Document '$documentName' updated successfully!\n";
    } else {
        echo "Document '$documentName' does not exist!\n";
    }
}

// A function to display a document
function displayDocument() {
    echo "Enter the name of the document to display: ";
    $documentName = trim(fgets(STDIN));
    if (file_exists($documentName)) {
        $content = file_get_contents($documentName);
        echo "Content of '$documentName':\n$content\n";
    } else {
        echo "Document '$documentName' does not exist!\n";
    }
}

// A function to save a document
function saveDocument($documentName, $content) {
    file_put_contents($documentName, $content);
}

// The main function that orchestrates the entire program
function main() {
    while (true) {
        displayMenu();
        $choice = trim(fgets(STDIN));
        switch ($choice) {
            case '1':
                createDocument();
                break;
            case '2':
                editDocument();
                break;
            case '3':
                displayDocument();
                break;
            case '4':
                echo "Exiting the Simple Text Editor. Farewell!\n";
                exit(0);
            default:
                echo "Invalid choice! Please try again.\n";
        }
    }
}

// The grand entry point of the program
main();

/**
 */
?>