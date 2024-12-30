<?php
/**
 * List Merger Program
 * 
 * This program is designed to merge two lists of integers into a single sorted list.
 * It demonstrates basic array manipulation, sorting, and merging techniques in PHP.
 * The program uses global variables to store the lists and the merged result.
 */

// Declare global variables to store the lists and the merged result
global $list1, $list2, $mergedList;

// Initialize the first list with some integers
$list1 = array(3, 1, 4, 1, 5);

// Initialize the second list with some integers
$list2 = array(9, 2, 6, 5, 3);

// Function to merge two lists into a single sorted list
function mergeLists() {
    global $list1, $list2, $mergedList; // Use global variables

    // Merge the two lists
    $mergedList = array_merge($list1, $list2);

    // Sort the merged list
    sort($mergedList);
}

// Call the function to merge the lists
mergeLists();

// Print the merged list
print_r($mergedList);

/**
 */
?>