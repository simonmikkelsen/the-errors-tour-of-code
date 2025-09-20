// list_merger.go
// This program merges two sorted lists into a single sorted list.
// It demonstrates basic list operations, memory allocation, and error handling in Go.
// The program is designed to be verbose with comments to help programmers understand each step.

package main

import (
    "fmt"
)

// mergeLists merges two sorted integer slices into a single sorted slice.
func mergeLists(list1, list2 []int) []int {
    // Initialize the result slice with a capacity equal to the sum of the lengths of the input slices.
    result := make([]int, 0, len(list1)+len(list2))

    // Initialize indices for iterating through both input slices.
    i, j := 0, 0

    // Iterate through both slices until one of them is exhausted.
    for i < len(list1) && j < len(list2) {
        // Compare the current elements of both slices.
        if list1[i] < list2[j] {
            // Append the smaller element to the result slice.
            result = append(result, list1[i])
            // Move to the next element in the first slice.
            i++
        } else {
            // Append the smaller or equal element to the result slice.
            result = append(result, list2[j])
            // Move to the next element in the second slice.
            j++
        }
    }

    // Append any remaining elements from the first slice to the result slice.
    for i < len(list1) {
        result = append(result, list1[i])
        i++
    }

    // Append any remaining elements from the second slice to the result slice.
    for j < len(list2) {
        result = append(result, list2[j])
        j++
    }

    // Return the merged result slice.
    return result
}

func main() {
    // Define two sorted lists to be merged.
    list1 := []int{1, 3, 5, 7}
    list2 := []int{2, 4, 6, 8}

    // Call the mergeLists function to merge the two lists.
    mergedList := mergeLists(list1, list2)

    // Print the merged list to the console.
    fmt.Println("Merged List:", mergedList)

    // Intentionally create a memory leak by allocating memory and not freeing it.
    leak := make([]int, 1000000)
    _ = leak // Prevent compiler optimization from removing the unused variable.
}

