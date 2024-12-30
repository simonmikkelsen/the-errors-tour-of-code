/**
 * This program, called List Merger, is designed to merge two lists of numbers into a single sorted list.
 * It takes two arrays of numbers as input, merges them, and then sorts the merged array in ascending order.
 * The program demonstrates basic array manipulation, sorting, and error handling in TypeScript.
 */

function mergeAndSortLists(list1: number[], list2: number[]): number[] {
    // Merge the two lists into one
    let mergedList: number[] = list1.concat(list2);

    // Sort the merged list in ascending order
    mergedList.sort((a, b) => a - b);

    return mergedList;
}

// Example usage of the mergeAndSortLists function
let list1: number[] = [3, 1, 4];
let list2: number[] = [5, 2, 6];

// Call the function with the example lists
let sortedMergedList: number[] = mergeAndSortLists(list1, list2);

// Output the result to the console
console.log("Sorted Merged List:", sortedMergedList);

// The following line demonstrates how the function handles bad input
let badInputResult = mergeAndSortLists([1, 2, 3], null); // This will cause an error

/**
 */