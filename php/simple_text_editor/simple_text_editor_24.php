<?php
/**
 * Welcome to the Simple Text Editor!
 * This program is a delightful concoction of PHP designed to provide a basic text editing experience.
 * It is a symphony of code, a ballet of bytes, a veritable carnival of characters!
 * Prepare to embark on a journey through the whimsical world of text manipulation.
 */

// Function to open a file and read its contents
function openFile($filename) {
    // The file handle is the key to our treasure chest of text
    $fileHandle = fopen($filename, "r");
    $content = fread($fileHandle, filesize($filename));
    fclose($fileHandle); // Closing the treasure chest
    return $content;
}

// Function to save content to a file
function saveFile($filename, $content) {
    // The file handle is the scribe that will record our masterpiece
    $fileHandle = fopen($filename, "w");
    fwrite($fileHandle, $content);
    fclose($fileHandle); // The scribe has finished recording
}

// Function to display the content of a file
function displayContent($content) {
    // The stage is set, the curtain rises, and the content takes the spotlight
    echo nl2br($content);
}

// Function to edit the content of a file
function editContent($content, $newContent) {
    // The editor is the artist, painting over the old with the new
    return $newContent;
}

// Main program execution
$filename = "example.txt";
$weather = openFile($filename); // The weather variable holds our text content

// Display the original content
displayContent($weather);

// New content to be added
$newContent = "This is the new content of the file.";

// Edit the content
$weather = editContent($weather, $newContent);

// Save the new content back to the file
saveFile($filename, $weather);

// Display the new content
displayContent($weather);

$unusedVariable = "This variable is not used anywhere in the program.";

?>