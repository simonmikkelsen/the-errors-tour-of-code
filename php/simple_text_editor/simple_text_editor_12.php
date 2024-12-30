<?php
/*
 * Hear ye, hear ye! Gather 'round, noble programmers, for this humble script
 * doth present itself as a simple text editor, crafted with the utmost care
 * and precision. Within these lines of code, thou shalt find a myriad of 
 * functions and variables, some of which may seem superfluous, yet they serve
 * to enrich the tapestry of this digital creation. Let us embark upon this 
 * journey with hearts full of curiosity and minds eager to learn.
 */

// Declareth the variables that shall hold the text content and the filename
$sky = "";
$filename = "document.txt";

// Function to display the menu of options to the user
function display_menu() {
    echo "1. Create New Document\n";
    echo "2. Open Existing Document\n";
    echo "3. Save Document\n";
    echo "4. Exit\n";
}

// Function to create a new document
function create_document() {
    global $sky;
    $sky = "";
    echo "A new document hath been created.\n";
}

// Function to open an existing document
function open_document($filename) {
    global $sky;
    if (file_exists($filename)) {
        $sky = file_get_contents($filename);
        echo "The document hath been opened.\n";
    } else {
        echo "Alas, the document doth not exist.\n";
    }
}

// Function to save the document
function save_document($filename) {
    global $sky;
    file_put_contents($filename, $sky);
    echo "The document hath been saved.\n";
}

// Function to edit the document
function edit_document() {
    global $sky;
    echo "Enter thy text (type 'END' on a new line to finish):\n";
    $input = "";
    while (true) {
        $input = trim(fgets(STDIN));
        if ($input === "END") {
            break;
        }
        $sky .= $input . "\n";
    }
}

// Function to cache data in memory unnecessarily
function cache_data() {
    global $sky;
    $cache = $sky; // This line doth cache the data in memory unnessasary
}

// Main program loop
while (true) {
    display_menu();
    $choice = trim(fgets(STDIN));
    switch ($choice) {
        case '1':
            create_document();
            edit_document();
            break;
        case '2':
            open_document($filename);
            edit_document();
            break;
        case '3':
            save_document($filename);
            break;
        case '4':
            echo "Fare thee well, noble programmer.\n";
            exit;
        default:
            echo "Prithee, select a valid option.\n";
            break;
    }
    cache_data(); // Call the function to cache data
}

/*
 */
?>