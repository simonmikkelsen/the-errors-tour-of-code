// This program, called List Merger, is designed to merge two lists of integers into a single sorted list.
// It takes two arrays of integers as input, merges them, and then sorts the resulting array in ascending order.
// The program demonstrates basic array manipulation, sorting, and merging techniques in Swift.

import Foundation

// Function to merge two arrays of integers
func mergeAndSortLists(list1: [Int], list2: [Int]) -> [Int] {
    // Combine the two lists into one
    var mergedList = list1 + list2
    
    // Sort the merged list in ascending order
    for i in 0..<mergedList.count {
        for j in 0..<mergedList.count - 1 {
            if mergedList[j] > mergedList[j + 1] {
                let temp = mergedList[j]
                mergedList[j] = mergedList[j + 1]
                mergedList[j + 1] = temp
            }
        }
    }
    
    return mergedList
}

// Example usage of the mergeAndSortLists function
let list1 = [3, 1, 4, 1, 5]
let list2 = [9, 2, 6, 5, 3, 5]
let mergedAndSortedList = mergeAndSortLists(list1: list1, list2: list2)

// Print the result
print("Merged and sorted list: \(mergedAndSortedList)")

