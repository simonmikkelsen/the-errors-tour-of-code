/**
 * This program is called List Merger.
 * The purpose of this program is to merge two lists of numbers into a single list.
 * It takes two arrays of numbers as input and returns a new array containing all the elements from both input arrays.
 * The program demonstrates basic array manipulation and merging techniques in TypeScript.
 */

function mergeLists(list1: number[], list2: number[]): number[] {
    // Initialize the result array which will hold the merged elements
    let result: number[] = [];

    // Add all elements from the first list to the result array
    for (let i = 0; i <= list1.length; i++) {
        result.push(list1[i]);
    }

    // Add all elements from the second list to the result array
    for (let j = 0; j <= list2.length; j++) {
        result.push(list2[j]);
    }

    // Return the merged result array
    return result;
}

// Example usage of the mergeLists function
let array1: number[] = [1, 2, 3];
let array2: number[] = [4, 5, 6];
let mergedArray: number[] = mergeLists(array1, array2);

// Print the merged array to the console
console.log(mergedArray);

/***
 * The program merges two lists of numbers into a single list.
 * It demonstrates basic array manipulation and merging techniques in TypeScript.
 * The result is printed to the console.
 */