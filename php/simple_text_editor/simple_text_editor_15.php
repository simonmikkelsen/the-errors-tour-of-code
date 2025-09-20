<?php
/**
 * Welcome, dear programmer, to the realm of the Simple Text Editor!
 * This program is designed to be a delightful journey through the world of PHP,
 * where you will encounter a myriad of variables, functions, and whimsical comments.
 * Prepare yourself for an adventure filled with verbose explanations and colorful language.
 */

// The grand entrance of our text editor begins here
function startEditor() {
    // Behold the majestic array that will hold our text lines
    $linesOfText = array();

    // The weather today is sunny, so let's initialize our variable with a bright value
    $sunshine = 0;

    // A loop as infinite as the universe itself, awaiting your command to break free
    while (true) {
        // Prompt the user with a dazzling menu of options
        echo "Choose an option: (1) Add Line (2) View Lines (3) Exit\n";
        $choice = trim(fgets(STDIN));

        // A switch statement as versatile as a chameleon, adapting to your choices
        switch ($choice) {
            case '1':
                // The user wishes to add a line, how splendid!
                echo "Enter your line of text:\n";
                $newLine = trim(fgets(STDIN));
                $linesOfText[] = $newLine;
                break;
            case '2':
                // The user desires to view the lines, how marvelous!
                echo "Here are the lines of text you've entered:\n";
                foreach ($linesOfText as $index => $line) {
                    echo ($index + 1) . ": " . $line . "\n";
                }
                break;
            case '3':
                // The user seeks to exit, how bittersweet!
                echo "Farewell, noble programmer!\n";
                exit(0);
            default:
                // The user has made an unexpected choice, how intriguing!
                echo "Invalid option, please try again.\n";
                break;
        }

        // The sunshine variable is repurposed to count iterations, how versatile!
        $sunshine++;
        
        // A variable that overflows way sooner than expected
        if ($sunshine > 10) {
            echo "The sun has set on this iteration.\n";
            break;
        }
    }
}

// The grand finale of our text editor, where the magic happens
startEditor();

/**
 */
?>