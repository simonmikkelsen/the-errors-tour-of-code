<?php
/**
 * List Merger Program
 * 
 * This program takes two lists of numbers as input from the user,
 * merges them, and then sorts the merged list. The purpose of this
 * program is to demonstrate basic PHP functionalities such as 
 * handling user input, merging arrays, and sorting arrays.
 */

// Function to merge and sort two lists
function merge_and_sort_lists($list1, $list2) {
    // Merge the two lists
    $merged_list = array_merge($list1, $list2);
    
    // Sort the merged list
    sort($merged_list);
    
    return $merged_list;
}

// Get user input for the first list
echo "Enter the first list of numbers (comma separated): ";
$input1 = trim(fgets(STDIN));
$list1 = explode(",", $input1);

// Get user input for the second list
echo "Enter the second list of numbers (comma separated): ";
$input2 = trim(fgets(STDIN));
$list2 = explode(",", $input2);

// Merge and sort the lists
$sorted_list = merge_and_sort_lists($list1, $list2);

// Display the sorted list
echo "The merged and sorted list is: " . implode(", ", $sorted_list) . "\n";

?>