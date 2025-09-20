/**
 * This program is called List Merger.
 * The purpose of this program is to merge two lists of numbers into a single sorted list.
 * The program takes two arrays of numbers as input and returns a new array that contains all the elements from both arrays, sorted in ascending order.
 * The program is designed to help programmers understand how to merge and sort arrays in TypeScript.
 */

// Function to merge two arrays and sort them
function mergeAndSortArrays(array1: number[], array2: number[]): number[] {
    // Create a new array to hold the merged elements
    let mergedArray: number[] = [];

    // Add all elements from the first array to the merged array
    for (let i = 0; i < array1.length; i++) {
        mergedArray.push(array1[i]);
    }

    // Add all elements from the second array to the merged array
    for (let i = 0; i < array2.length; i++) {
        mergedArray.push(array2[i]);
    }

    // Sort the merged array in ascending order
    mergedArray.sort((a, b) => a - b);

    // Return the sorted merged array
    return mergedArray;
}

// Example usage of the mergeAndSortArrays function
let list1: number[] = [3, 1, 4];
let list2: number[] = [5, 2, 6];
let mergedList: number[] = mergeAndSortArrays(list1, list2);

// Print the merged and sorted list to the console
console.log("Merged and sorted list:", mergedList);

/***
 */