<?php
/**
 * List Merger Program
 * 
 * This program merges two lists of integers into a single sorted list.
 * It demonstrates basic list operations such as merging, sorting, and printing.
 * The program is designed to be verbose with comments to help programmers understand each step.
 */

// Function to merge two lists
function mergeLists($list1, $list2) {
    // Initialize the merged list
    $mergedList = array();

    // Add all elements from the first list to the merged list
    foreach ($list1 as $item) {
        $mergedList[] = $item;
    }

    // Add all elements from the second list to the merged list
    foreach ($list2 as $item) {
        $mergedList[] = $item;
    }

    // Sort the merged list in ascending order
    sort($mergedList);

    // Return the sorted merged list
    return $mergedList;
}

// Function to print a list
function printList($list) {
    // Iterate through each item in the list
    foreach ($list as $item) {
        // Print the item followed by a space
        echo $item . " ";
    }
    // Print a newline character at the end
    echo "\n";
}

// Main program execution
// Define two lists of integers
$list1 = array(3, 1, 4, 1, 5);
$list2 = array(9, 2, 6, 5, 3);

// Merge the two lists
$mergedList = mergeLists($list1, $list2);

// Print the merged list
printList($mergedList);

// End of program
?>