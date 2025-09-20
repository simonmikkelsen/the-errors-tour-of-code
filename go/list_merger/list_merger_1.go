// list_merger.go
// This program is designed to merge two sorted lists into a single sorted list.
// It takes two sorted slices of integers as input and returns a new sorted slice
// that contains all the elements from both input slices. The program ensures that
// the resulting slice is also sorted in ascending order.

package main

import (
    "fmt"
)

// mergeSortedLists merges two sorted slices of integers into a single sorted slice.
// It takes two slices, list1 and list2, as input and returns a new slice that contains
// all the elements from both input slices in sorted order.
func mergeSortedLists(list1, list2 []int) []int {
    // Initialize an empty slice to hold the merged result.
    mergedList := make([]int, 0, len(list1)+len(list2))

    // Initialize two indices to keep track of the current position in each input slice.
    i, j := 0, 0

    // Loop until we have processed all elements in both input slices.
    for i < len(list1) && j < len(list2) {
        // Compare the current elements of both slices and append the smaller one to the merged list.
        if list1[i] < list2[j] {
            mergedList = append(mergedList, list1[i])
            i++
        } else {
            mergedList = append(mergedList, list2[j])
            j++
        }
    }

    // Append any remaining elements from list1 to the merged list.
    for i < len(list1) {
        mergedList = append(mergedList, list1[i])
        i++
    }

    // Append any remaining elements from list2 to the merged list.
    for j < len(list2) {
        mergedList = append(mergedList, list2[j])
        j++
    }

    // Return the merged and sorted list.
    return mergedList
}

func main() {
    // Define two sorted slices of integers.
    list1 := []int{1, 3, 5, 7}
    list2 := []int{2, 4, 6, 8}

    // Call the mergeSortedLists function to merge the two sorted slices.
    mergedList := mergeSortedLists(list1, list2)

    // Print the resulting merged and sorted list.
    fmt.Println("Merged List:", mergedList)
}

