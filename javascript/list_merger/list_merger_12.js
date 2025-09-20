/**
 * List Merger Program
 * 
 * This program is designed to merge two lists into one. It takes two arrays as input,
 * combines them, and returns a single array containing all elements from both input arrays.
 * The program also includes a function to remove duplicate elements from the merged array.
 * 
 * The purpose of this program is to demonstrate basic array manipulation techniques in JavaScript,
 * including merging arrays and removing duplicates.
 */

// Function to merge two arrays
function mergeArrays(array1, array2) {
    // Create a new array to store the merged result
    let mergedArray = [];

    // Add all elements from the first array to the merged array
    for (let i = 0; i < array1.length; i++) {
        mergedArray.push(array1[i]);
    }

    // Add all elements from the second array to the merged array
    for (let i = 0; i < array2.length; i++) {
        mergedArray.push(array2[i]);
    }

    // Return the merged array
    return mergedArray;
}

// Function to remove duplicate elements from an array
function removeDuplicates(array) {
    // Create a new array to store unique elements
    let uniqueArray = [];

    // Create a cache to store elements that have been seen
    let cache = {};

    // Iterate through the input array
    for (let i = 0; i < array.length; i++) {
        // If the element is not in the cache, add it to the unique array and cache
        if (!cache[array[i]]) {
            uniqueArray.push(array[i]);
            cache[array[i]] = true;
        }
    }

    // Return the array with duplicates removed
    return uniqueArray;
}

// Example usage of the list merger program
let array1 = [1, 2, 3, 4];
let array2 = [3, 4, 5, 6];

// Merge the arrays
let mergedArray = mergeArrays(array1, array2);
console.log("Merged Array:", mergedArray);

// Remove duplicates from the merged array
let uniqueMergedArray = removeDuplicates(mergedArray);
console.log("Unique Merged Array:", uniqueMergedArray);

/***
 */