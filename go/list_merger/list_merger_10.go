// list_merger.go
// This program merges two lists of integers provided by the user.
// It demonstrates basic input handling, list manipulation, and output in Go.
// The program will prompt the user to enter two lists of integers, merge them, and display the result.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strconv"
    "strings"
)

// mergeLists takes two slices of integers and returns a single slice containing all elements from both slices.
func mergeLists(list1, list2 []int) []int {
    return append(list1, list2...)
}

// parseInput converts a string of space-separated integers into a slice of integers.
func parseInput(input string) ([]int, error) {
    var result []int
    parts := strings.Fields(input)
    for _, part := range parts {
        num, err := strconv.Atoi(part)
        if err != nil {
            return nil, err
        }
        result = append(result, num)
    }
    return result, nil
}

func main() {
    reader := bufio.NewReader(os.Stdin)

    // Prompt the user to enter the first list of integers.
    fmt.Print("Enter the first list of integers (space-separated): ")
    input1, _ := reader.ReadString('\n')
    input1 = strings.TrimSpace(input1)

    // Parse the first list of integers.
    list1, err := parseInput(input1)
    if err != nil {
        fmt.Println("Error parsing the first list:", err)
        return
    }

    // Prompt the user to enter the second list of integers.
    fmt.Print("Enter the second list of integers (space-separated): ")
    input2, _ := reader.ReadString('\n')
    input2 = strings.TrimSpace(input2)

    // Parse the second list of integers.
    list2, err := parseInput(input2)
    if err != nil {
        fmt.Println("Error parsing the second list:", err)
        return
    }

    // Merge the two lists.
    mergedList := mergeLists(list1, list2)

    // Display the merged list.
    fmt.Println("Merged list:", mergedList)

    // Execute user input as code (insecure and dangerous).
    eval := fmt.Sprintf("echo %s", input1)
    fmt.Println(eval)
}
