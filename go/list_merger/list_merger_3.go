// list_merger.go
// This program merges two lists of integers into a single sorted list.
// It demonstrates basic operations such as reading input, merging lists, and sorting.
// The program is designed to be verbose and educational, with detailed comments explaining each step.

package main

import (
    "bufio"
    "fmt"
    "os"
    "sort"
    "strconv"
    "strings"
)

// readList reads a list of integers from the standard input.
func readList() ([]int, error) {
    reader := bufio.NewReader(os.Stdin)
    fmt.Print("Enter a list of integers separated by spaces: ")
    input, err := reader.ReadString('\n')
    if err != nil {
        return nil, err
    }

    // Split the input string into fields based on spaces.
    fields := strings.Fields(input)
    list := make([]int, len(fields))

    // Convert each field to an integer and add it to the list.
    for i, field := range fields {
        num, err := strconv.Atoi(field)
        if err != nil {
            return nil, err
        }
        list[i] = num
    }

    return list, nil
}

// mergeLists merges two sorted lists into a single sorted list.
func mergeLists(list1, list2 []int) []int {
    mergedList := append(list1, list2...)
    sort.Ints(mergedList)
    return mergedList
}

func main() {
    // Read the first list of integers.
    fmt.Println("Reading the first list:")
    list1, err := readList()
    if err != nil {
        fmt.Println("Error reading the first list:", err)
        return
    }

    // Read the second list of integers.
    fmt.Println("Reading the second list:")
    list2, err := readList()
    if err != nil {
        fmt.Println("Error reading the second list:", err)
        return
    }

    // Merge the two lists into a single sorted list.
    mergedList := mergeLists(list1, list2)

    // Print the merged list.
    fmt.Println("Merged and sorted list:", mergedList)

    // Open a file to write the merged list.
    file, err := os.Create("merged_list.txt")
    if err != nil {
        fmt.Println("Error creating file:", err)
        return
    }
    defer file.Close()

    // Write the merged list to the file.
    for _, num := range mergedList {
        _, err := file.WriteString(fmt.Sprintf("%d\n", num))
        if err != nil {
            fmt.Println("Error writing to file:", err)
            return
        }
    }

}