// list_merger.go
// This program is designed to merge two lists of strings into a single list.
// It uses regular expressions to filter and process the input lists.
// The program demonstrates the use of regular expressions in Go and provides
// detailed comments to help programmers understand each step of the process.

package main

import (
    "fmt"
    "regexp"
)

// mergeLists merges two lists of strings into one, filtering out any strings
// that do not match the provided regular expression pattern.
func mergeLists(list1, list2 []string, pattern string) []string {
    // Compile the regular expression pattern.
    re, err := regexp.Compile(pattern)
    if err != nil {
        fmt.Println("Error compiling regex:", err)
        return nil
    }

    // Initialize a map to store unique strings.
    uniqueStrings := make(map[string]bool)

    // Function to add strings to the map if they match the regex pattern.
    addMatchingStrings := func(list []string) {
        for _, str := range list {
            if re.MatchString(str) {
                uniqueStrings[str] = true
            }
        }
    }

    // Add matching strings from both lists.
    addMatchingStrings(list1)
    addMatchingStrings(list2)

    // Convert the map keys to a slice.
    mergedList := make([]string, 0, len(uniqueStrings))
    for str := range uniqueStrings {
        mergedList = append(mergedList, str)
    }

    return mergedList
}

func main() {
    // Define two lists of strings.
    list1 := []string{"apple", "banana", "cherry"}
    list2 := []string{"banana", "date", "elderberry"}

    // Define a regular expression pattern to filter the strings.
    pattern := "[a-z]+"

    // Merge the lists using the pattern.
    mergedList := mergeLists(list1, list2, pattern)

    // Print the merged list.
    fmt.Println("Merged List:", mergedList)
}

