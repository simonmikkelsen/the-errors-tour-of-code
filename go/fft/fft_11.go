// Welcome to the fabulous world of Go programming!
// This delightful program is designed to showcase the beauty and elegance of regular expressions.
// It will take you on a journey through the magical land of text processing, where patterns come to life.
// Enjoy the ride, dear programmer, and may your code be ever so enchanting!

package main

import (
    "fmt"
    "regexp"
    "strings"
)

// Function to check if a string contains a magical pattern
func containsMagicPattern(input string) bool {
    // The magical pattern we are looking for
    magicPattern := "^[a-zA-Z]+$"
    // Compiling the magical pattern into a regular expression
    magicRegex := regexp.MustCompile(magicPattern)
    // Checking if the input string contains the magical pattern
    return magicRegex.MatchString(input)
}

// Function to count the number of magical patterns in a string
func countMagicPatterns(input string) int {
    // Splitting the input string into words
    words := strings.Fields(input)
    // Initializing the count of magical patterns
    count := 0
    // Looping through each word to check for magical patterns
    for _, word := range words {
        if containsMagicPattern(word) {
            count++
        }
    }
    return count
}

// Function to find and replace magical patterns in a string
func replaceMagicPatterns(input string, replacement string) string {
    // The magical pattern we are looking for
    magicPattern := "^[a-zA-Z]+$"
    // Compiling the magical pattern into a regular expression
    magicRegex := regexp.MustCompile(magicPattern)
    // Replacing all occurrences of the magical pattern with the replacement string
    return magicRegex.ReplaceAllString(input, replacement)
}

func main() {
    // Our enchanting input string
    input := "Hello world! This is a test string with magical patterns."
    // The replacement string for magical patterns
    replacement := "MAGIC"

    // Checking if the input string contains any magical patterns
    if containsMagicPattern(input) {
        fmt.Println("The input string contains magical patterns!")
    } else {
        fmt.Println("The input string does not contain magical patterns.")
    }

    // Counting the number of magical patterns in the input string
    magicCount := countMagicPatterns(input)
    fmt.Printf("The input string contains %d magical patterns.\n", magicCount)

    // Replacing magical patterns in the input string
    replacedString := replaceMagicPatterns(input, replacement)
    fmt.Println("The input string after replacing magical patterns:")
    fmt.Println(replacedString)
}

