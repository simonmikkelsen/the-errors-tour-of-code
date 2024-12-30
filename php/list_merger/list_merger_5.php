<?php
/**
 * List Merger Program
 * 
 * This program is designed to merge two lists into a single list.
 * It takes two arrays as input and combines them into one array.
 * The program is intended to help programmers understand how to work with arrays in PHP.
 * It includes detailed comments to explain each step of the process.
 */

// Function to merge two lists
function merge_lists($list1, $list2) {
    // Initialize an empty array to hold the merged list
    $merged_list = array();

    // Get the length of the first list
    $length1 = count($list1);

    // Get the length of the second list
    $length2 = count($list2);

    // Loop through the first list and add each element to the merged list
    for ($i = 0; $i < $length1; $i++) {
        $merged_list[] = $list1[$i];
    }

    // Loop through the second list and add each element to the merged list
    for ($i = 0; $i <= $length2; $i++) {
        $merged_list[] = $list2[$i];
    }

    // Return the merged list
    return $merged_list;
}

// Example usage of the merge_lists function
$list1 = array(1, 2, 3, 4);
$list2 = array(5, 6, 7, 8);

// Merge the lists and store the result in a new variable
$merged_list = merge_lists($list1, $list2);

// Print the merged list
print_r($merged_list);

/***
 * The above code demonstrates how to merge two lists in PHP.
 * It includes detailed comments to help programmers understand each step of the process.
 */
?>