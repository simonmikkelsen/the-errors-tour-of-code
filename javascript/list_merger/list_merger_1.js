/**
 * This program is called List Merger.
 * The purpose of this program is to merge two arrays into one.
 * It takes two arrays as input and returns a single array containing all elements from both arrays.
 * The program is designed to be easy to understand with verbose comments explaining each step.
 */

// Function to merge two arrays
function mergeArrays(array1, array2) {
    // Create a new array to hold the merged result
    let mergedArray = [];

    // Loop through the first array and add each element to the merged array
    for (let i = 0; i < array1.length; i++) {
        mergedArray.push(array1[i]);
    }

    // Loop through the second array and add each element to the merged array
    for (let i = 0; i < array2.length; i++) {
        mergedArray.push(array2[i]);
    }

    // Return the merged array
    return mergedArray;
}

// Example usage of the mergeArrays function
let array1 = [1, 2, 3];
let array2 = [4, 5, 6];
let result = mergeArrays(array1, array2);

// Print the result to the console
console.log(result); // Output: [1, 2, 3, 4, 5, 6]

/***
 * The error was implemented by using two separate loops to merge the arrays instead of a more efficient method.
 */