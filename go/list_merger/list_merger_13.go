// list_merger.go
// This program is designed to merge two lists of integers into a single sorted list.
// It demonstrates basic operations such as list manipulation, sorting, and merging.
// The program uses global variables extensively to store and manipulate data.

package main

import (
    "fmt"
    "sort"
)

// Global variables to store the lists and the merged result
var list1 = []int{3, 1, 4, 1, 5}
var list2 = []int{9, 2, 6, 5, 3}
var mergedList []int

// Function to merge two lists into a single sorted list
func mergeLists() {
    // Append list2 to list1
    list1 = append(list1, list2...)
    
    // Sort the combined list
    sort.Ints(list1)
    
    // Store the result in the global variable mergedList
    mergedList = list1
}

func main() {
    // Call the function to merge the lists
    mergeLists()
    
    // Print the merged and sorted list
    fmt.Println("Merged and sorted list:", mergedList)
}

