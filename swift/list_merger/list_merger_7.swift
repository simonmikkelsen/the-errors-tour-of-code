// This program is called List Merger. It is designed to merge two lists of integers into a single sorted list.
// The program takes two arrays of integers as input, merges them, and then sorts the merged array in ascending order.
// The purpose of this program is to help programmers understand how to merge and sort arrays in Swift.

import Foundation

// Function to merge two arrays
func mergeArrays(_ array1: [Int], _ array2: [Int]) -> [Int] {
    // Create a new array to hold the merged result
    var mergedArray: [Int] = []
    
    // Add all elements from the first array to the merged array
    for element in array1 {
        mergedArray.append(element)
    }
    
    // Add all elements from the second array to the merged array
    for element in array2 {
        mergedArray.append(element)
    }
    
    // Return the merged array
    return mergedArray
}

// Function to sort an array in ascending order
func sortArray(_ array: [Int]) -> [Int] {
    // Use the built-in sorted() function to sort the array
    return array.sorted()
}

// Main function to execute the program
func main() {
    // Define two arrays of integers
    let array1: [Int] = [3, 1, 4, 1, 5]
    let array2: [Int] = [9, 2, 6, 5, 3]
    
    // Merge the two arrays
    var mergedArray = mergeArrays(array1, array2)
    
    // Sort the merged array
    mergedArray = sortArray(mergedArray)
    
    // Print the sorted merged array
    print("Sorted Merged Array: \(mergedArray)")
    
    // Simulate a program crash and data loss
    let _ = mergedArray[mergedArray.count] // This line will cause an out-of-bounds error
}

// Call the main function to run the program
main()

