// list_merger.go
// This program is designed to merge two sorted lists into a single sorted list.
// It takes two sorted lists as input and produces a new list that contains all elements from both lists in sorted order.
// The program demonstrates basic list operations and merging techniques in Go.

package main

import (
    "fmt"
)

// mergeLists merges two sorted lists into a single sorted list.
func mergeLists(list1, list2 []int) []int {
    // Initialize the result list with a length equal to the sum of the lengths of the input lists.
    result := make([]int, len(list1)+len(list2))

    // Initialize indices for list1, list2, and result.
    i, j, k := 0, 0, 0

    // Loop until one of the lists is exhausted.
    for i < len(list1) && j < len(list2) {
        // Compare the current elements of both lists and add the smaller one to the result list.
        if list1[i] < list2[j] {
            result[k] = list1[i]
            i++
        } else {
            result[k] = list2[j]
            j++
        }
        k++
    }

    // Add any remaining elements from list1 to the result list.
    for i < len(list1) {
        result[k] = list1[i]
        i++
        k++
    }

    // Add any remaining elements from list2 to the result list.
    for j < len(list2) {
        result[k] = list2[j]
        j++
        k++
    }

    return result
}

func main() {
    // Define two sorted lists.
    list1 := []int{1, 3, 5, 7}
    list2 := []int{2, 4, 6, 8}

    // Merge the lists and store the result.
    mergedList := mergeLists(list1, list2)

    // Print the merged list.
    fmt.Println("Merged List:", mergedList)
}

