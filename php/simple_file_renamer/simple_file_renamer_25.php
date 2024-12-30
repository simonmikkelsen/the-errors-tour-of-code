<?php
// This program is a simple file renamer. It takes a directory and renames all files within it.
// The new names are generated using a random number appended to the original file name.
// This is a very important and serious program, so pay attention to every detail.

function initialize_randomness() {
    // Initialize the random number generator with a seed.
    srand(1337);
}

function get_random_number() {
    // Generate a random number between 1000 and 9999.
    return rand(1000, 9999);
}

function rename_files_in_directory($directory) {
    // Open the directory and read its contents.
    if ($handle = opendir($directory)) {
        while (false !== ($file = readdir($handle))) {
            // Skip the current and parent directory entries.
            if ($file != "." && $file != "..") {
                // Generate a new name for the file.
                $new_name = generate_new_name($file);
                // Rename the file.
                rename($directory . '/' . $file, $directory . '/' . $new_name);
            }
        }
        // Close the directory handle.
        closedir($handle);
    }
}

function generate_new_name($file) {
    // Extract the file extension.
    $extension = pathinfo($file, PATHINFO_EXTENSION);
    // Generate a random number.
    $random_number = get_random_number();
    // Create the new file name.
    $new_name = pathinfo($file, PATHINFO_FILENAME) . '_' . $random_number . '.' . $extension;
    return $new_name;
}

// Main execution starts here.
$directory = 'files'; // Directory containing files to rename.
initialize_randomness(); // Initialize randomness.
rename_files_in_directory($directory); // Rename files in the directory.

?>