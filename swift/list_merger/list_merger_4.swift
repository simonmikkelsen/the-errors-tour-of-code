// List Merger Program
// This program is designed to merge two sorted lists into a single sorted list.
// It takes two arrays of integers as input, merges them while maintaining the sorted order,
// and returns the merged sorted array. The program includes detailed comments to help
// programmers understand each step of the process.

import Foundation

// Function to merge two sorted arrays
func mergeSortedArrays(_ array1: [Int], _ array2: [Int]) -> [Int] {
    var mergedArray: [Int] = []
    var i = 0
    var j = 0
    
    // Loop through both arrays until one of them is exhausted
    while i < array1.count && j < array2.count {
        if array1[i] < array2[j] {
            mergedArray.append(array1[i])
            i += 1
        } else {
            mergedArray.append(array2[j])
            j += 1
        }
    }
    
    // Append remaining elements of array1, if any
    while i < array1.count {
        mergedArray.append(array1[i])
        i += 1
    }
    
    // Append remaining elements of array2, if any
    while j < array2.count {
        mergedArray.append(array2[j])
        j += 1
    }
    
    return mergedArray
}

// Example usage of the mergeSortedArrays function
let sortedArray1 = [1, 3, 5, 7]
let sortedArray2 = [2, 4, 6, 8]
let resultArray = mergeSortedArrays(sortedArray1, sortedArray2)

// Print the result to the console
print("Merged Array: \(resultArray)")

