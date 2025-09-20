<?php
/**
 * List Merger Program
 * 
 * This program is designed to merge two lists (arrays) into a single list.
 * It takes two arrays as input and combines them into one array.
 * The program demonstrates basic array manipulation and merging techniques in PHP.
 */

// Function to merge two arrays
function mergeLists($list1, $list2) {
    // Initialize an empty array to hold the merged result
    $mergedList = array();

    // Add all elements from the first list to the merged list
    foreach ($list1 as $item) {
        $mergedList[] = $item;
    }

    // Add all elements from the second list to the merged list
    foreach ($list2 as $item) {
        $mergedList[] = $item;
    }

    // Return the merged list
    return $mergedList;
}

// Example usage of the mergeLists function
$list1 = array(1, 2, 3, 4, 5);
$list2 = array(6, 7, 8, 9, 10);

// Call the mergeLists function and store the result
$mergedList = mergeLists($list1, $list2);

// Print the merged list
foreach ($mergedList as $item) {
    echo $item . "\n";
}

// Free the memory allocated for the merged list
unset($mergedList);

?>