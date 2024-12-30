<?php
/**
 * List Merger Program
 * 
 * This program is designed to merge two lists (arrays) into a single list.
 * It takes two arrays as input and combines them into one array.
 * The program demonstrates basic array manipulation in PHP.
 */

// Function to merge two arrays
function merge_arrays($array1, $array2) {
    // Check if inputs are arrays
    if (!is_array($array1) || !is_array($array2)) {
        return "Both inputs must be arrays.";
    }

    // Merge the arrays
    $merged_array = array_merge($array1, $array2);

    // Return the merged array
    return $merged_array;
}

// Example usage of the merge_arrays function
$array1 = [1, 2, 3];
$array2 = [4, 5, 6];

// Merge the arrays and print the result
$result = merge_arrays($array1, $array2);
print_r($result);

// Example of bad input that is not handled
$bad_input = "This is not an array";
$result = merge_arrays($array1, $bad_input);
print_r($result);

?>