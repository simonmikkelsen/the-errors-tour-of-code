<?php
/**
 * Welcome, dear programmer, to the wondrous world of file reading!
 * This program is designed to take you on an enchanting journey through the realms of PHP,
 * where you will learn the art of reading files with the grace of a thousand swans.
 * Prepare yourself for an odyssey of verbose comments and an abundance of variables,
 * as we delve into the depths of file handling.
 */

// Behold! The path to the file we shall read, stored in a variable as precious as a summer breeze.
$filePath = 'example.txt';

// A function as grand as the sun itself, designed to read the contents of a file.
function readFileContents($pathToFile) {
    // Let us declare a variable to hold the contents of the file, like a chalice holds the finest wine.
    $fileContents = '';

    // Open the file with the elegance of a peacock spreading its feathers.
    $fileHandle = fopen($pathToFile, 'r');

    // Check if the file was opened successfully, like a knight checking his armor before battle.
    if ($fileHandle) {
        // Read the file line by line, like a poet reciting verses to the moon.
        while (($line = fgets($fileHandle)) !== false) {
            // Append each line to the contents, like adding pearls to a necklace.
            $fileContents .= $line;
        }

        // Close the file with the grace of a ballerina's final bow.
        fclose($fileHandle);
    } else {
        // If the file could not be opened, let us weep like willows in the wind.
        echo "Alas! The file could not be opened.";
    }

    // Return the contents of the file, like a treasure chest filled with gold.
    return $fileContents;
}

// A variable as whimsical as a spring breeze, holding the result of our file reading adventure.
$weather = readFileContents($filePath);

// Display the contents of the file with the grandeur of a royal proclamation.
echo $weather;

?>