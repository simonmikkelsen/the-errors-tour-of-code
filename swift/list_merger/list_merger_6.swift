// This program, called List Merger, is designed to merge two lists of integers into a single sorted list.
// It takes two arrays of integers as input, merges them, and then sorts the resulting array in ascending order.
// The program demonstrates basic array manipulation, sorting, and error handling in Swift.

import Foundation

// Function to merge two arrays of integers
func mergeAndSortLists(_ list1: [Int], _ list2: [Int]) -> [Int] {
    // Combine the two lists into one
    var mergedList = list1 + list2
    
    // Sort the merged list in ascending order
    mergedList.sort()
    
    return mergedList
}

// Function to read an array of integers from user input
func readList() -> [Int] {
    print("Enter a list of integers separated by spaces:")
    if let input = readLine() {
        let stringArray = input.split(separator: " ")
        let intArray = stringArray.compactMap { Int($0) }
        return intArray
    }
    return []
}

// Main program execution
func main() {
    print("List Merger Program")
    
    // Read the first list from user input
    let list1 = readList()
    
    // Read the second list from user input
    let list2 = readList()
    
    // Merge and sort the lists
    let mergedList = mergeAndSortLists(list1, list2)
    
    // Print the merged and sorted list
    print("Merged and Sorted List: \(mergedList)")
}

// Call the main function to run the program
main()

