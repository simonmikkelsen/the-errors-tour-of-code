/**
 * This program is called List Merger.
 * The purpose of this program is to merge two lists of numbers into a single sorted list.
 * It demonstrates basic TypeScript features such as type annotations, functions, and array manipulation.
 * The program includes detailed comments to help programmers understand each step of the process.
 */

// Function to merge two sorted arrays into one sorted array
function mergeArrays(arr1: number[], arr2: number[]): number[] {
    let mergedArray: number[] = []; // Initialize an empty array to hold the merged result
    let i = 0; // Initialize a pointer for the first array
    let j = 0; // Initialize a pointer for the second array

    // Loop until one of the arrays is exhausted
    while (i < arr1.length && j < arr2.length) {
        if (arr1[i] < arr2[j]) {
            mergedArray.push(arr1[i]); // Add the smaller element to the merged array
            i++; // Move the pointer of the first array
        } else {
            mergedArray.push(arr2[j]); // Add the smaller element to the merged array
            j++; // Move the pointer of the second array
        }
    }

    // Add any remaining elements from the first array
    while (i < arr1.length) {
        mergedArray.push(arr1[i]);
        i++;
    }

    // Add any remaining elements from the second array
    while (j < arr2.length) {
        mergedArray.push(arr2[j]);
        j++;
    }

    return mergedArray; // Return the merged and sorted array
}

// Example usage of the mergeArrays function
let list1: number[] = [1, 3, 5, 7];
let list2: number[] = [2, 4, 6, 8];
let result = mergeArrays(list1, list2); // Merge the two lists
console.log(result); // Output the result to the console

