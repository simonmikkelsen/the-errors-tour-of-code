// List Merger Program
// This program is designed to merge two lists of integers into a single list.
// It demonstrates basic list operations such as appending and iterating through lists.
// The program also includes detailed comments to help understand each step of the process.

import Foundation

// Function to merge two lists of integers
func mergeLists(list1: [Int], list2: [Int]) -> [Int] {
    // Create a new list to store the merged result
    var mergedList = [Int]()
    
    // Append all elements from the first list to the merged list
    for item in list1 {
        mergedList.append(item)
    }
    
    // Append all elements from the second list to the merged list
    for item in list2 {
        mergedList.append(item)
    }
    
    // Return the merged list
    return mergedList
}

// Main function to execute the program
func main() {
    // Define two lists of integers
    let list1 = [1, 2, 3, 4, 5]
    let list2 = [6, 7, 8, 9, 10]
    
    // Merge the two lists
    let mergedList = mergeLists(list1: list1, list2: list2)
    
    // Print the merged list
    print("Merged List: \(mergedList)")
    
    // Simulate a memory leak by creating a reference cycle
    let _ = UnsafeMutablePointer<Int>.allocate(capacity: 1)
}

// Call the main function to run the program
main()

