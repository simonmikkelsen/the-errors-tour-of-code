/**
 * List Merger Program
 * 
 * This TypeScript program is designed to merge two lists of numbers into a single sorted list.
 * The program takes two arrays of numbers as input, merges them, and then sorts the resulting array.
 * The purpose of this program is to demonstrate basic array manipulation and sorting techniques in TypeScript.
 * 
 * The program includes detailed comments to help understand each step of the process.
 */

function mergeAndSortLists(list1: number[], list2: number[]): number[] {
    // Step 1: Merge the two lists into one
    let mergedList: number[] = list1.concat(list2);

    // Step 2: Sort the merged list in ascending order
    mergedList.sort((a, b) => a - b);

    // Return the sorted merged list
    return mergedList;
}

// Example usage of the mergeAndSortLists function
let listA: number[] = [3, 1, 4];
let listB: number[] = [5, 2, 6];

let resultList: number[] = mergeAndSortLists(listA, listB);

// Output the result to the console
console.log("Merged and Sorted List:", resultList);

