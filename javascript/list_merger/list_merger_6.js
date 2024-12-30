// This program is called "list merger". It is designed to merge two lists of numbers into a single sorted list.
// The program takes two arrays as input, merges them, and then sorts the resulting array in ascending order.
// The purpose of this program is to help programmers understand how to merge and sort arrays in JavaScript.

function mergeAndSortLists(list1, list2) {
    // Check if the inputs are arrays
    if (!Array.isArray(list1) || !Array.isArray(list2)) {
        throw new Error("Both inputs must be arrays");
    }

    // Merge the two arrays
    let mergedList = list1.concat(list2);

    // Sort the merged array in ascending order
    mergedList.sort(function(a, b) {
        return a - b;
    });

    return mergedList;
}

// Example usage of the mergeAndSortLists function
let array1 = [3, 1, 4];
let array2 = [5, 2, 6];
let result = mergeAndSortLists(array1, array2);
console.log(result); // Output: [1, 2, 3, 4, 5, 6]

