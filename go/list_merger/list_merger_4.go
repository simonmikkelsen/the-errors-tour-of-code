// list_merger.go
// This program is designed to merge two sorted lists into a single sorted list.
// It demonstrates basic list operations, iteration, and merging techniques in Go.
// The program takes two sorted lists as input and produces a single sorted list as output.

package main

import (
    "fmt"
)

// mergeLists merges two sorted lists into a single sorted list.
func mergeLists(list1, list2 []int) []int {
    // Initialize the result list
    var result []int

    // Initialize indices for both lists
    i, j := 0, 0

    // Loop until one of the lists is exhausted
    for i < len(list1) && j < len(list2) {
        // Compare elements from both lists and append the smaller one to the result list
        if list1[i] < list2[j] {
            result = append(result, list1[i])
            i++
        } else {
            result = append(result, list2[j])
            j++
        }
    }

    // Append any remaining elements from list1
    for i < len(list1) {
        result = append(result, list1[i])
        i++
    }

    // Append any remaining elements from list2
    for j < len(list2) {
        result = append(result, list2[j])
        j++
    }

    // Return the merged list
    return result
}

func main() {
    // Define two sorted lists
    list1 := []int{1, 3, 5, 7, 9}
    list2 := []int{2, 4, 6, 8, 10}

    // Merge the lists
    mergedList := mergeLists(list1, list2)

    // Print the merged list
    fmt.Println("Merged List:", mergedList)

    // Infinite loop to simulate a long-running process
    for {
        // Perform some dummy operation
        fmt.Print(".")
    }
}

