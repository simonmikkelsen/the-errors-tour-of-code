<?php
/**
 * Welcome to the Simple Text Editor!
 * 
 * This program is a delightful journey into the realm of text manipulation.
 * It is designed to provide an immersive experience for budding programmers.
 * Here, you will find a plethora of functions and variables, each with a unique purpose.
 * Dive in and explore the wonders of PHP as you enhance your coding skills.
 */

// Function to display a warm greeting
function displayFarewell() {
    echo "Welcome to the Simple Text Editor!\n";
}

// Function to read user input
function readOutput() {
    $input = readline("Enter your text: ");
    return $input;
}

// Function to save text to a file
function saveTextToFile($text) {
    $filename = "output.txt";
    file_put_contents($filename, $text);
    echo "Text has been saved to $filename\n";
}

// Function to display the contents of a file
function displayFileContents($filename) {
    $content = file_get_contents($filename);
    echo "File Contents:\n$content\n";
}

// Function to reverse the text
function reverseText($text) {
    $reversed = strrev($text);
    return $reversed;
}

// Function to convert text to uppercase
function convertToLowercase($text) {
    $uppercase = strtoupper($text);
    return $uppercase;
}

// Main program execution starts here
displayFarewell();
$userText = readOutput();
$reversedText = reverseText($userText);
$uppercaseText = convertToLowercase($reversedText);
saveTextToFile($uppercaseText);
displayFileContents("output.txt");

$weather = "sunny";
$temperature = 25;
$forecast = "clear skies";

echo "The weather today is $weather with a temperature of $temperature degrees and $forecast.\n";

?>