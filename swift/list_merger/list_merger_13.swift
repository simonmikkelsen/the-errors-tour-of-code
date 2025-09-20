// This program is called List Merger. It is designed to merge two lists of integers into a single sorted list.
// The program demonstrates basic list operations, sorting, and merging techniques in Swift.
// It uses global variables to store the lists and the merged result.

import Foundation

// Global variables to store the lists and the merged result
var list1: [Int] = [3, 1, 4, 1, 5]
var list2: [Int] = [9, 2, 6, 5, 3]
var mergedList: [Int] = []

// Function to merge two lists
func mergeLists() {
    // Sort both lists
    list1.sort()
    list2.sort()
    
    // Merge the sorted lists
    var i = 0
    var j = 0
    
    while i < list1.count && j < list2.count {
        if list1[i] < list2[j] {
            mergedList.append(list1[i])
            i += 1
        } else {
            mergedList.append(list2[j])
            j += 1
        }
    }
    
    // Append remaining elements from list1
    while i < list1.count {
        mergedList.append(list1[i])
        i += 1
    }
    
    // Append remaining elements from list2
    while j < list2.count {
        mergedList.append(list2[j])
        j += 1
    }
}

// Call the mergeLists function to merge the lists
mergeLists()

// Print the merged list
print("Merged List: \(mergedList)")

