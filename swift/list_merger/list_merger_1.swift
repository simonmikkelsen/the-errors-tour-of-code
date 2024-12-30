// List Merger Program
// This program is designed to merge two lists of integers into a single sorted list.
// The program takes two arrays of integers as input, merges them, and then sorts the resulting array.
// The purpose of this program is to demonstrate basic array manipulation and sorting in Swift.

import Foundation

// Function to merge two arrays
func mergeArrays(_ array1: [Int], _ array2: [Int]) -> [Int] {
    // Create a new array to hold the merged result
    var mergedArray: [Int] = []
    
    // Append all elements from the first array to the merged array
    for element in array1 {
        mergedArray.append(element)
    }
    
    // Append all elements from the second array to the merged array
    for element in array2 {
        mergedArray.append(element)
    }
    
    // Sort the merged array in ascending order
    let sortedArray = mergedArray.sorted()
    
    // Return the sorted merged array
    return sortedArray
}

// Example usage of the mergeArrays function
let array1 = [3, 1, 4]
let array2 = [5, 9, 2]

let mergedAndSortedArray = mergeArrays(array1, array2)

// Print the result to the console
print("Merged and Sorted Array: \(mergedAndSortedArray)")

