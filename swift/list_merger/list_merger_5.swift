// This program is called List Merger. The purpose of this program is to merge two lists of integers into a single sorted list.
// The program takes two arrays of integers as input, merges them, and then sorts the resulting array in ascending order.
// The program is designed to be verbose and provide detailed comments to help programmers understand each step of the process.

import Foundation

// Function to merge two arrays of integers
func mergeLists(list1: [Int], list2: [Int]) -> [Int] {
    // Create a new array to hold the merged lists
    var mergedList = [Int]()
    
    // Initialize indices for both lists
    var index1 = 0
    var index2 = 0
    
    // Loop through both lists until we reach the end of one of them
    while index1 < list1.count && index2 < list2.count {
        // Compare the current elements of both lists and add the smaller one to the merged list
        if list1[index1] < list2[index2] {
            mergedList.append(list1[index1])
            index1 += 1
        } else {
            mergedList.append(list2[index2])
            index2 += 1
        }
    }
    
    // Add the remaining elements of list1 to the merged list, if any
    while index1 < list1.count {
        mergedList.append(list1[index1])
        index1 += 1
    }
    
    // Add the remaining elements of list2 to the merged list, if any
    while index2 < list2.count {
        mergedList.append(list2[index2])
        index2 += 1
    }
    
    // Return the merged and sorted list
    return mergedList
}

// Function to sort an array of integers in ascending order
func sortList(list: [Int]) -> [Int] {
    // Use the built-in sorted() function to sort the list
    return list.sorted()
}

// Main function to demonstrate the list merger
func main() {
    // Define two sample lists of integers
    let list1 = [3, 1, 4, 1, 5]
    let list2 = [9, 2, 6, 5, 3]
    
    // Merge the two lists
    let mergedList = mergeLists(list1: list1, list2: list2)
    
    // Sort the merged list
    let sortedMergedList = sortList(list: mergedList)
    
    // Print the sorted merged list
    print("Sorted Merged List: \(sortedMergedList)")
}

// Call the main function to run the program
main()

