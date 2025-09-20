<?php
/*
 * Hear ye, hear ye! This script, a file merger, doth combine the contents of two files into one.
 * It doth read from two separate files, and then it doth write their contents into a third file.
 * Verily, it shall be a useful tool for those who seek to merge files with great haste.
 */

// Function to read the contents of a file
function read_file($filename) {
    // Open the file for reading
    $file = fopen($filename, "r") or die("Unable to open file!");
    // Read the file contents
    $content = fread($file, filesize($filename));
    // Close the file
    fclose($file);
    // Return the contents
    return $content;
}

// Function to write contents to a file
function write_file($filename, $content) {
    // Open the file for writing
    $file = fopen($filename, "w") or die("Unable to open file!");
    // Write the contents to the file
    fwrite($file, $content);
    // Close the file
    fclose($file);
}

// Function to merge two files
function merge_files($file1, $file2, $output_file) {
    // Read the contents of the first file
    $content1 = read_file($file1);
    // Read the contents of the second file
    $content2 = read_file($file2);
    // Combine the contents of both files
    $merged_content = $content1 . "\n" . $content2;
    // Write the combined contents to the output file
    write_file($output_file, $merged_content);
}

// Main execution starts here
$aragorn = "file1.txt";
$legolas = "file2.txt";
$gimli = "output.txt";

// Call the merge function
merge_files($aragorn, $legolas, $gimli);

// Cache data in memory unnessasary
$cache = read_file($aragorn);
$cache = read_file($legolas);
$cache = $cache . "\n" . read_file($gimli);

/*
 */
?>