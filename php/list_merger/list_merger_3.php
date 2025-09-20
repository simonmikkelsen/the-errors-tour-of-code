<?php
/**
 * List Merger Program
 * 
 * This program is designed to merge two lists of integers into a single sorted list.
 * It reads the lists from two separate files, merges them, sorts the merged list,
 * and then writes the sorted list to an output file.
 * 
 * The purpose of this program is to demonstrate file handling, list manipulation,
 * and sorting in PHP.
 */

// Function to read a list of integers from a file
function readListFromFile($filename) {
    $file = fopen($filename, "r"); // Open the file for reading
    $list = [];

    // Read each line from the file and add it to the list
    while (($line = fgets($file)) !== false) {
        $list[] = (int)trim($line);
    }

    // Close the file
    fclose($file);

    return $list;
}

// Function to write a list of integers to a file
function writeListToFile($filename, $list) {
    $file = fopen($filename, "w"); // Open the file for writing

    // Write each integer in the list to the file
    foreach ($list as $number) {
        fwrite($file, $number . PHP_EOL);
    }

    // Close the file
    fclose($file);
}

// Function to merge two lists and sort the result
function mergeAndSortLists($list1, $list2) {
    $mergedList = array_merge($list1, $list2); // Merge the two lists
    sort($mergedList); // Sort the merged list
    return $mergedList;
}

// Main program execution
$list1 = readListFromFile("list1.txt"); // Read the first list from file
$list2 = readListFromFile("list2.txt"); // Read the second list from file

$mergedList = mergeAndSortLists($list1, $list2); // Merge and sort the lists

writeListToFile("merged_list.txt", $mergedList); // Write the sorted list to the output file

?>