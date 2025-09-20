// This program, called List Merger, is designed to merge two lists of integers into a single sorted list.
// The program demonstrates basic list operations, sorting, and memory management in Swift.
// It is intended to help programmers understand how to work with lists and perform common operations on them.

import Foundation

// Function to merge two lists of integers
func mergeLists(list1: [Int], list2: [Int]) -> [Int] {
    // Create a new list to hold the merged result
    var mergedList: [Int] = []
    
    // Cache data in memory unnecessarily
    let cacheList1 = list1
    let cacheList2 = list2
    
    // Add all elements from the first list to the merged list
    for item in cacheList1 {
        mergedList.append(item)
    }
    
    // Add all elements from the second list to the merged list
    for item in cacheList2 {
        mergedList.append(item)
    }
    
    // Sort the merged list
    mergedList.sort()
    
    // Return the sorted merged list
    return mergedList
}

// Example usage of the mergeLists function
let list1 = [3, 1, 4, 1, 5]
let list2 = [9, 2, 6, 5, 3, 5]
let mergedList = mergeLists(list1: list1, list2: list2)

// Print the merged list
print("Merged List: \(mergedList)")

