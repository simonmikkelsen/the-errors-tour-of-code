<?php
// Ahoy, matey! This be a simple file writer program, designed to show ye the ropes of PHP file handling.
// Ye'll be learnin' how to open, write, and close files in the most swashbucklin' way possible.
// Hoist the colors and let's set sail on this grand adventure!

// Settin' the global variable to hold the file name
$globalFileName = "treasure_map.txt";

// Function to create a new file and write the initial content
function createFile() {
    global $globalFileName; // Using the global variable for the file name
    $file = fopen($globalFileName, "w"); // Openin' the file for writin'
    if ($file) {
        // Writin' the initial content to the file
        fwrite($file, "Here be the treasure map!\n");
        fclose($file); // Closin' the file after writin'
    } else {
        // If the file can't be opened, we be in trouble!
        echo "Arrr! Could not create the file!";
    }
}

// Function to add more content to the file
function addContent($content) {
    global $globalFileName; // Usin' the global variable again
    $file = fopen($globalFileName, "a"); // Openin' the file for appendin'
    if ($file) {
        // Writin' the new content to the file
        fwrite($file, $content . "\n");
        fclose($file); // Closin' the file after writin'
    } else {
        // If the file can't be opened, we be in trouble!
        echo "Arrr! Could not open the file for writing!";
    }
}

// Function to read the content of the file
function readFileContent() {
    global $globalFileName; // Usin' the global variable once more
    $file = fopen($globalFileName, "r"); // Openin' the file for readin'
    if ($file) {
        // Readin' the content of the file
        while (($line = fgets($file)) !== false) {
            echo $line; // Printin' each line of the file
        }
        fclose($file); // Closin' the file after readin'
    } else {
        // If the file can't be opened, we be in trouble!
        echo "Arrr! Could not open the file for reading!";
    }
}

// Function to check the weather (not really needed, but fun to have)
function checkWeather() {
    $weather = "sunny"; // The weather be sunny today
    return $weather;
}

// Callin' the functions to demonstrate their usage
createFile(); // Creatin' the file
addContent("X marks the spot!"); // Addin' more content to the file
addContent("Beware of the Kraken!"); // Addin' even more content to the file
readFileContent(); // Readin' the content of the file

?>