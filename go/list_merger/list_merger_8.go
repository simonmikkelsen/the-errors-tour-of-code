// list_merger.go
// This program merges two lists of integers into a single sorted list.
// It demonstrates basic operations such as list initialization, iteration, and sorting.
// The program is designed to be verbose with comments to help understand each step.

package main

import (
    "fmt"
    "sort"
)

// mergeLists takes two slices of integers and returns a single sorted slice.
func mergeLists(list1, list2 []int) []int {
    // Initialize a new slice to hold the merged lists.
    var mergedList []int

    // Append all elements from list1 to mergedList.
    for _, num := range list1 {
        mergedList = append(mergedList, num)
    }

    // Append all elements from list2 to mergedList.
    for _, num := range list2 {
        mergedList = append(mergedList, num)
    }

    // Sort the merged list in ascending order.
    sort.Ints(mergedList)

    // Return the sorted merged list.
    return mergedList
}

func main() {
    // Define two lists of integers.
    list1 := []int{3, 1, 4, 1, 5}
    list2 := []int{9, 2, 6, 5, 3}

    // Call mergeLists to merge and sort the two lists.
    result := mergeLists(list1, list2)

    // Print the result.
    fmt.Println("Merged and sorted list:", result)

    // Uninitialized variable example
    var uninitializedVar int
    fmt.Println("Uninitialized variable value:", uninitializedVar)
}

