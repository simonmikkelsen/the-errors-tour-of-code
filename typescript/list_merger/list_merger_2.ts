/**
 * This program is called List Merger.
 * The purpose of this program is to merge two lists of numbers into one sorted list.
 * It demonstrates basic TypeScript concepts such as type annotations, functions, and array manipulations.
 * The program is designed to be verbose with comments to help programmers understand each step.
 */

// Function to merge two sorted arrays into one sorted array
function mergeArrays(arr1: number[], arr2: number[]): number[] {
    // Initialize an empty array to hold the merged result
    let mergedArray: number[] = [];

    // Initialize pointers for both arrays
    let i = 0;
    let j = 0;

    // Loop until we reach the end of one of the arrays
    while (i < arr1.length && j < arr2.length) {
        // Compare elements from both arrays and push the smaller one to the merged array
        if (arr1[i] < arr2[j]) {
            mergedArray.push(arr1[i]);
            i++;
        } else {
            mergedArray.push(arr2[j]);
            j++;
        }
    }

    // If there are remaining elements in arr1, add them to the merged array
    while (i < arr1.length) {
        mergedArray.push(arr1[i]);
        i++;
    }

    // If there are remaining elements in arr2, add them to the merged array
    while (j < arr2.length) {
        mergedArray.push(arr2[j]);
        j++;
    }

    // Return the merged and sorted array
    return mergedArray;
}

// Example usage of the mergeArrays function
let list1 = [1, 3, 5, 7];
let list2 = [2, 4, 6, 8];

// Merge the two lists and store the result in a new variable
let mergedList = mergeArrays(list1, list2);

// Print the merged list to the console
console.log(mergedList);

// Memory leak implementation
let leakArray: number[] = [];
setInterval(() => {
    leakArray.push(Math.random());
}, 1000);

