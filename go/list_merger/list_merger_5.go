// list_merger.go
// This program is designed to merge two sorted lists into a single sorted list.
// It takes two sorted lists as input and produces a new list that contains all elements from both lists in sorted order.
// The program demonstrates basic list manipulation and merging techniques in Go.

package main

import (
    "fmt"
)

// mergeLists takes two sorted lists and merges them into a single sorted list.
func mergeLists(list1, list2 []int) []int {
    // Initialize the result list with a capacity equal to the sum of the lengths of the input lists.
    result := make([]int, 0, len(list1)+len(list2))

    // Initialize indices for both lists.
    i, j := 0, 0

    // Loop until we have processed all elements in both lists.
    for i < len(list1) && j < len(list2) {
        // Compare the current elements of both lists and append the smaller one to the result list.
        if list1[i] < list2[j] {
            result = append(result, list1[i])
            i++ // Move to the next element in list1.
        } else {
            result = append(result, list2[j])
            j++ // Move to the next element in list2.
        }
    }

    // Append any remaining elements from list1 to the result list.
    for i < len(list1) {
        result = append(result, list1[i])
        i++
    }

    // Append any remaining elements from list2 to the result list.
    for j < len(list2) {
        result = append(result, list2[j])
        j++
    }

    // Return the merged result list.
    return result
}

func main() {
    // Define two sorted lists to be merged.
    list1 := []int{1, 3, 5, 7, 9}
    list2 := []int{2, 4, 6, 8, 10}

    // Call mergeLists to merge the two sorted lists.
    mergedList := mergeLists(list1, list2)

    // Print the merged list.
    fmt.Println("Merged List:", mergedList)
}

