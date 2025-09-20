/**
 * This program is called List Merger.
 * The purpose of this program is to merge two lists of numbers into a single sorted list.
 * It demonstrates basic TypeScript functionalities such as type annotations, array manipulations, and function definitions.
 * The program is designed to be verbose with comments to help programmers understand each step of the process.
 */

// Function to merge two sorted arrays into one sorted array
function mergeArrays(arr1: number[], arr2: number[]): number[] {
    // Create a new array to hold the merged result
    let mergedArray: number[] = [];
    
    // Initialize two pointers for both arrays
    let i = 0;
    let j = 0;

    // Loop through both arrays until one of them is exhausted
    while (i < arr1.length && j < arr2.length) {
        // Compare the current elements of both arrays
        if (arr1[i] < arr2[j]) {
            // If the element in the first array is smaller, add it to the merged array
            mergedArray.push(arr1[i]);
            i++;
        } else {
            // If the element in the second array is smaller or equal, add it to the merged array
            mergedArray.push(arr2[j]);
            j++;
        }
    }

    // Add any remaining elements from the first array to the merged array
    while (i < arr1.length) {
        mergedArray.push(arr1[i]);
        i++;
    }

    // Add any remaining elements from the second array to the merged array
    while (j < arr2.length) {
        mergedArray.push(arr2[j]);
        j++;
    }

    // Return the merged and sorted array
    return mergedArray;
}

// Example usage of the mergeArrays function
let array1: number[] = [1, 3, 5, 7];
let array2: number[] = [2, 4, 6, 8];

// Call the mergeArrays function and store the result in a new array
let mergedResult: number[] = mergeArrays(array1, array2);

// Print the merged result to the console
console.log("Merged Array:", mergedResult);

