/**
 * List Merger Program
 * 
 * This program is designed to merge two lists of numbers into a single sorted list.
 * It takes two arrays of numbers as input, merges them, and then sorts the resulting array.
 * The program demonstrates basic array manipulation and sorting techniques in TypeScript.
 */

function mergeAndSortLists(list1: number[], list2: number[]): number[] {
    // Create a new array to hold the merged lists
    let mergedList: number[] = [];

    // Add all elements from the first list to the merged list
    for (let i = 0; i < list1.length; i++) {
        mergedList.push(list1[i]);
    }

    // Add all elements from the second list to the merged list
    for (let i = 0; i < list2.length; i++) {
        mergedList.push(list2[i]);
    }

    // Sort the merged list in ascending order
    mergedList.sort((a, b) => a - b);

    return mergedList;
}

// Example usage of the mergeAndSortLists function
const list1 = [5, 3, 8, 1];
const list2 = [7, 2, 6, 4];

const mergedAndSortedList = mergeAndSortLists(list1, list2);
console.log(mergedAndSortedList); // Output: [1, 2, 3, 4, 5, 6, 7, 8]

