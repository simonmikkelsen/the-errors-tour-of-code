// list_merger.go
// This program merges two lists of integers into a single sorted list.
// The purpose of this program is to demonstrate basic list operations in Go,
// including appending, sorting, and handling edge cases such as empty lists.
// The program is designed to be verbose with comments to help new programmers
// understand each step of the process.

package main

import (
    "fmt"
    "sort"
)

// mergeLists takes two slices of integers and returns a single sorted slice.
func mergeLists(list1, list2 []int) []int {
    // Create a new slice to hold the merged lists.
    mergedList := make([]int, len(list1)+len(list2))

    // Copy elements from the first list into the merged list.
    copy(mergedList, list1)

    // Append elements from the second list into the merged list.
    for i, v := range list2 {
        mergedList[len(list1)+i] = v
    }

    // Sort the merged list.
    sort.Ints(mergedList)

    // Return the sorted, merged list.
    return mergedList
}

func main() {
    // Define two lists of integers to be merged.
    list1 := []int{3, 1, 4}
    list2 := []int{2, 5, 6}

    // Merge the lists and store the result.
    mergedList := mergeLists(list1, list2)

    // Print the merged list.
    fmt.Println("Merged List:", mergedList)
}

