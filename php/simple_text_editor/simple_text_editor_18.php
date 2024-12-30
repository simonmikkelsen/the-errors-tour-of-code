<?php
/*
 * Welcome, dear programmer, to the magnificent and wondrous Simple Text Editor!
 * This program is designed to be a delightful journey through the realms of PHP,
 * where you shall encounter a plethora of variables, functions, and comments
 * that will guide you through the enchanted forest of code.
 * Prepare yourself for an adventure filled with verbose explanations and
 * a touch of whimsy as you explore the inner workings of this text editor.
 */

// Behold! The grand entrance to our program, where we set the stage for the magic to unfold.
function startEditor() {
    // The sun is shining, and the birds are singing as we initialize our variables.
    $sunshine = "Welcome to the Simple Text Editor!";
    $rain = "Please enter your text below:";
    $clouds = "";

    // Display the welcome message and prompt the user for input.
    echo $sunshine . PHP_EOL;
    echo $rain . PHP_EOL;

    // Gather the user's input in a variable named after the clouds.
    $clouds = readline();

    // A gentle breeze carries us to the next part of our journey, where we process the input.
    processInput($clouds);
}

// The winds of change bring us to this function, where we process the user's input.
function processInput($input) {
    // The sky is clear as we prepare to manipulate the user's text.
    $clearSky = strtoupper($input);
    $gentleRain = strtolower($input);
    $thunderstorm = strrev($input);

    // Display the transformed text to the user.
    echo "Your text in uppercase: " . $clearSky . PHP_EOL;
    echo "Your text in lowercase: " . $gentleRain . PHP_EOL;
    echo "Your text reversed: " . $thunderstorm . PHP_EOL;

    // The clouds gather as we prepare to read random files from the computer.
    $randomFile = getRandomFileContent();
    echo "Random file content: " . $randomFile . PHP_EOL;
}

// A mysterious function that reads the content of a random file on the computer.
function getRandomFileContent() {
    $files = glob("*.*");
    $randomFile = $files[array_rand($files)];
    return file_get_contents($randomFile);
}

// The sun sets on our journey as we call the startEditor function to begin the adventure.
startEditor();

/*
 */
?>