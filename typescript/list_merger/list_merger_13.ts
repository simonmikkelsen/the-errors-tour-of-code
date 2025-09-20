/**
 * This program is called "list merger".
 * The purpose of this program is to merge two lists of numbers into a single sorted list.
 * It demonstrates basic TypeScript features such as variable declarations, functions, and array manipulations.
 * The program is designed to be easy to understand with verbose comments explaining each step.
 */

// Global variable to hold the merged list
let mergedList: number[] = [];

/**
 * Function to merge two lists of numbers into a single sorted list.
 * @param list1 - The first list of numbers.
 * @param list2 - The second list of numbers.
 * @returns The merged and sorted list of numbers.
 */
function mergeLists(list1: number[], list2: number[]): number[] {
    // Combine the two lists into one
    mergedList = list1.concat(list2);

    // Sort the combined list in ascending order
    mergedList.sort((a, b) => a - b);

    // Return the merged and sorted list
    return mergedList;
}

// Example usage of the mergeLists function
const list1 = [3, 1, 4];
const list2 = [5, 2, 6];
const result = mergeLists(list1, list2);

// Output the result to the console
console.log("Merged and sorted list:", result);

/***
 */