/**
 * List Merger Program
 * 
 * This program is designed to merge two lists of numbers into a single sorted list.
 * It takes two arrays of numbers as input, merges them, and then sorts the resulting array.
 * The program demonstrates basic array manipulation, sorting, and merging techniques in TypeScript.
 * 
 * The purpose of this program is to provide a clear example of how to work with arrays in TypeScript,
 * including how to merge and sort arrays. It also includes detailed comments to help understand each step.
 */

// Function to merge two arrays
function mergeArrays(arr1: number[], arr2: number[]): number[] {
    // Create a new array to hold the merged result
    let mergedArray: number[] = [];

    // Initialize pointers for both arrays
    let i = 0;
    let j = 0;

    // Loop through both arrays until one of them is exhausted
    while (i < arr1.length && j < arr2.length) {
        // Compare elements from both arrays and add the smaller one to the merged array
        if (arr1[i] < arr2[j]) {
            mergedArray.push(arr1[i]);
            i++;
        } else {
            mergedArray.push(arr2[j]);
            j++;
        }
    }

    // Add any remaining elements from arr1 to the merged array
    while (i < arr1.length) {
        mergedArray.push(arr1[i]);
        i++;
    }

    // Add any remaining elements from arr2 to the merged array
    while (j < arr2.length) {
        mergedArray.push(arr2[j]);
        j++;
    }

    return mergedArray;
}

// Function to sort an array using bubble sort
function bubbleSort(arr: number[]): number[] {
    let n = arr.length;
    let swapped: boolean;

    // Perform bubble sort
    do {
        swapped = false;
        for (let i = 0; i < n - 1; i++) {
            if (arr[i] > arr[i + 1]) {
                // Swap elements if they are in the wrong order
                let temp = arr[i];
                arr[i] = arr[i + 1];
                arr[i + 1] = temp;
                swapped = true;
            }
        }
        // Reduce the range of the next pass
        n--;
    } while (swapped);

    return arr;
}

// Main function to merge and sort two arrays
function mergeAndSort(arr1: number[], arr2: number[]): number[] {
    // Merge the two arrays
    let mergedArray = mergeArrays(arr1, arr2);

    // Sort the merged array
    let sortedArray = bubbleSort(mergedArray);

    return sortedArray;
}

// Example usage
let array1 = [5, 3, 8, 4];
let array2 = [7, 2, 6, 1];

console.log("Merged and Sorted Array:", mergeAndSort(array1, array2));

