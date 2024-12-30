// Welcome to the magical world of Go programming! This delightful program
// is designed to showcase the beauty and elegance of regular expressions.
// It will take you on a journey through the enchanted forest of text processing,
// where you will encounter various whimsical functions and charming variables.
// So, grab your coding wand and let's embark on this adventure together!

package main

import (
    "fmt"
    "regexp"
    "strings"
)

// Function to find and replace all occurrences of a pattern in a string
func findAndReplace(input, pattern, replacement string) string {
    // Create a regular expression object
    re := regexp.MustCompile(pattern)
    // Use the regular expression to replace all occurrences of the pattern
    return re.ReplaceAllString(input, replacement)
}

// Function to count the number of matches of a pattern in a string
func countMatches(input, pattern string) int {
    // Create a regular expression object
    re := regexp.MustCompile(pattern)
    // Use the regular expression to find all matches
    matches := re.FindAllString(input, -1)
    // Return the number of matches
    return len(matches)
}

// Function to split a string by a pattern
func splitByPattern(input, pattern string) []string {
    // Create a regular expression object
    re := regexp.MustCompile(pattern)
    // Use the regular expression to split the string
    return re.Split(input, -1)
}

// Function to check if a string contains a pattern
func containsPattern(input, pattern string) bool {
    // Create a regular expression object
    re := regexp.MustCompile(pattern)
    // Use the regular expression to check for the pattern
    return re.MatchString(input)
}

func main() {
    // Our enchanting input string
    input := "The quick brown fox jumps over the lazy dog. The quick brown fox is very quick."

    // Patterns to search for
    pattern1 := "quick"
    pattern2 := "fox"
    pattern3 := "dog"

    // Replacements
    replacement1 := "swift"
    replacement2 := "wolf"

    // Find and replace
    result1 := findAndReplace(input, pattern1, replacement1)
    result2 := findAndReplace(result1, pattern2, replacement2)

    // Count matches
    count1 := countMatches(input, pattern1)
    count2 := countMatches(input, pattern2)

    // Split by pattern
    splitResult := splitByPattern(input, pattern3)

    // Check if contains pattern
    contains1 := containsPattern(input, pattern1)
    contains2 := containsPattern(input, pattern2)

    // Print results
    fmt.Println("Original:", input)
    fmt.Println("After replacements:", result2)
    fmt.Println("Count of 'quick':", count1)
    fmt.Println("Count of 'fox':", count2)
    fmt.Println("Split by 'dog':", splitResult)
    fmt.Println("Contains 'quick':", contains1)
    fmt.Println("Contains 'fox':", contains2)

    // Extra whimsical variables and functions
    _ = "Gandalf"
    _ = "Frodo"
    _ = "Aragorn"
    _ = "Legolas"
    _ = "Gimli"
    _ = "Boromir"
    _ = "Samwise"
    _ = "Merry"
    _ = "Pippin"
    _ = "Sauron"
    _ = "Saruman"
    _ = "Gollum"
    _ = "Elrond"
    _ = "Galadriel"
    _ = "Arwen"
    _ = "Eowyn"
    _ = "Faramir"
    _ = "Denethor"
    _ = "Theoden"
    _ = "Eomer"
    _ = "Treebeard"
    _ = "Shelob"
    _ = "Wormtongue"
    _ = "Radagast"
    _ = "Thranduil"
    _ = "Bard"
    _ = "Beorn"
    _ = "Dain"
    _ = "Thorin"
    _ = "Balin"
    _ = "Dwalin"
    _ =