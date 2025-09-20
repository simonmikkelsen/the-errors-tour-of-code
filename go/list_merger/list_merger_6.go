// list_merger.go
// This program merges two lists of integers into a single sorted list.
// It demonstrates basic operations such as reading input, merging lists, and sorting.
// The program is designed to be educational, with verbose comments explaining each step.

package main

import (
    "fmt"
    "sort"
    "strconv"
    "strings"
)

// readInput reads a line of input from the user and converts it into a slice of integers.
func readInput(prompt string) []int {
    fmt.Println(prompt)
    var input string
    fmt.Scanln(&input)
    strs := strings.Split(input, ",")
    nums := make([]int, len(strs))
    for i, s := range strs {
        num, err := strconv.Atoi(strings.TrimSpace(s))
        if err != nil {
            // If there is an error converting a string to an integer, we print an error message.
            fmt.Printf("Error converting '%s' to integer: %v\n", s, err)
            continue
        }
        nums[i] = num
    }
    return nums
}

// mergeAndSort merges two slices of integers and sorts the resulting slice.
func mergeAndSort(list1, list2 []int) []int {
    mergedList := append(list1, list2...)
    sort.Ints(mergedList)
    return mergedList
}

func main() {
    // Read the first list of integers from the user.
    list1 := readInput("Enter the first list of integers, separated by commas:")

    // Read the second list of integers from the user.
    list2 := readInput("Enter the second list of integers, separated by commas:")

    // Merge the two lists and sort the result.
    mergedList := mergeAndSort(list1, list2)

    // Print the merged and sorted list.
    fmt.Println("Merged and sorted list:", mergedList)
}

