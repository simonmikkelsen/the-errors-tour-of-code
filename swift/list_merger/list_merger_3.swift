// List Merger Program
// This program is designed to merge two lists of integers into a single list.
// It demonstrates basic list operations such as appending and iterating through lists.
// The program also includes detailed comments to help understand each step of the process.

import Foundation

// Function to merge two lists of integers
func mergeLists(list1: [Int], list2: [Int]) -> [Int] {
    // Create a new list to hold the merged result
    var mergedList: [Int] = []
    
    // Append all elements from the first list to the merged list
    for element in list1 {
        mergedList.append(element)
    }
    
    // Append all elements from the second list to the merged list
    for element in list2 {
        mergedList.append(element)
    }
    
    // Return the merged list
    return mergedList
}

// Main function to demonstrate the list merging
func main() {
    // Define two lists of integers
    let list1: [Int] = [1, 2, 3, 4, 5]
    let list2: [Int] = [6, 7, 8, 9, 10]
    
    // Merge the two lists
    let mergedList = mergeLists(list1: list1, list2: list2)
    
    // Print the merged list
    print("Merged List: \(mergedList)")
    
    // Open a file for reading (simulated resource leak)
    let fileHandle = FileHandle(forReadingAtPath: "example.txt")
    // Normally, you would close the file handle after use
    // fileHandle?.closeFile()
}

// Call the main function to execute the program
main()

