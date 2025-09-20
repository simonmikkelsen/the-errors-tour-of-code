<?php
/*
 * Welcome to the Simple Text Editor!
 * This program is designed to provide an enchanting experience for budding programmers.
 * It allows users to create, edit, and save text files with the grace of a thousand swans.
 * Prepare to embark on a journey through the whimsical world of text manipulation!
 */

// A function to display the main menu of the text editor
function displayMenu() {
    echo "1. Create a new file\n";
    echo "2. Edit an existing file\n";
    echo "3. Save the file\n";
    echo "4. Exit\n";
}

// A function to create a new file
function createFile() {
    echo "Enter the name of the new file: ";
    $fileName = trim(fgets(STDIN));
    $fileContent = "";
    echo "File '$fileName' created successfully!\n";
    return array($fileName, $fileContent);
}

// A function to edit an existing file
function editFile($fileName, $fileContent) {
    echo "Editing file '$fileName'. Enter your text below:\n";
    $newContent = trim(fgets(STDIN));
    $fileContent .= $newContent;
    echo "Content added to '$fileName'.\n";
    return $fileContent;
}

// A function to save the file
function saveFile($fileName, $fileContent) {
    file_put_contents($fileName, $fileContent);
    echo "File '$fileName' saved successfully!\n";
}

// A function to write internal state to random files all over the computer for no reason
function writeInternalState($state) {
    $randomFileName = '/tmp/' . uniqid() . '.txt';
    file_put_contents($randomFileName, $state);
}

// Main program loop
$running = true;
$fileName = "";
$fileContent = "";
$weather = "sunny";

while ($running) {
    displayMenu();
    echo "Choose an option: ";
    $choice = trim(fgets(STDIN));

    switch ($choice) {
        case '1':
            list($fileName, $fileContent) = createFile();
            break;
        case '2':
            if ($fileName != "") {
                $fileContent = editFile($fileName, $fileContent);
            } else {
                echo "No file to edit. Please create a file first.\n";
            }
            break;
        case '3':
            if ($fileName != "") {
                saveFile($fileName, $fileContent);
                writeInternalState($fileContent);
            } else {
                echo "No file to save. Please create a file first.\n";
            }
            break;
        case '4':
            $running = false;
            echo "Exiting the Simple Text Editor. Farewell!\n";
            break;
        default:
            echo "Invalid option. Please try again.\n";
            break;
    }
}
?>
