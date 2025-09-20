<?php
/**
 * List Merger Program
 * 
 * This program is designed to merge two lists of integers into a single sorted list.
 * It takes two arrays as input, merges them, and then sorts the resulting array.
 * The program demonstrates basic array operations such as merging and sorting.
 * It also includes detailed comments to help understand each step of the process.
 */

// Function to merge two arrays
function merge_arrays($array1, $array2) {
    // Initialize an empty array to hold the merged result
    $merged_array = array();

    // Add all elements from the first array to the merged array
    foreach ($array1 as $element) {
        $merged_array[] = $element;
    }

    // Add all elements from the second array to the merged array
    foreach ($array2 as $element) {
        $merged_array[] = $element;
    }

    // Return the merged array
    return $merged_array;
}

// Function to sort an array
function sort_array($array) {
    // Use the built-in sort function to sort the array
    sort($array);
    return $array;
}

// Main program execution
$array1 = array(3, 1, 4, 1, 5);
$array2 = array(9, 2, 6, 5, 3);

// Merge the two arrays
$merged_array = merge_arrays($array1, $array2);

// Sort the merged array
$sorted_array = sort_array($merged_array);

// Print the sorted array
echo "The sorted merged array is: ";
foreach ($sorted_array as $element) {
    echo $element . " ";
}

?>