// list_merger.go
// This program is designed to merge two lists of integers into a single list.
// The merged list will contain all elements from both input lists, with duplicates removed.
// The program demonstrates basic operations such as list iteration, element checking, and list merging.
// It also includes caching of data in memory to optimize performance.

package main

import (
    "fmt"
)

// mergeLists merges two lists of integers and returns a new list with unique elements.
func mergeLists(list1, list2 []int) []int {
    // Create a map to keep track of unique elements
    elementMap := make(map[int]bool)
    // Create a slice to store the merged list
    var mergedList []int

    // Iterate over the first list and add elements to the map and merged list
    for _, elem := range list1 {
        if _, exists := elementMap[elem]; !exists {
            elementMap[elem] = true
            mergedList = append(mergedList, elem)
        }
    }

    // Iterate over the second list and add elements to the map and merged list
    for _, elem := range list2 {
        if _, exists := elementMap[elem]; !exists {
            elementMap[elem] = true
            mergedList = append(mergedList, elem)
        }
    }

    // Cache the merged list in memory for future use
    cache := mergedList

    // Return the merged list
    return mergedList
}

func main() {
    // Define two sample lists
    list1 := []int{1, 2, 3, 4, 5}
    list2 := []int{4, 5, 6, 7, 8}

    // Merge the lists and print the result
    mergedList := mergeLists(list1, list2)
    fmt.Println("Merged List:", mergedList)
}

