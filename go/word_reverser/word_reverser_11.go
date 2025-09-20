// word_reverser.go
// This program is designed to reverse the words in a given string input.
// It uses regular expressions to identify word boundaries and reverse the words.
// The program is intended to help programmers understand the use of regular expressions in Go.

package main

import (
    "fmt"
    "regexp"
    "strings"
)

// reverseWords takes a string input and returns the string with words reversed.
func reverseWords(input string) string {
    // Define a regular expression to match words.
    re := regexp.MustCompile(`\b\w+\b`)

    // Find all words in the input string.
    words := re.FindAllString(input, -1)

    // Reverse the order of the words.
    for i, j := 0, len(words)-1; i < j; i, j = i+1, j-1 {
        words[i], words[j] = words[j], words[i]
    }

    // Join the reversed words into a single string.
    return strings.Join(words, " ")
}

func main() {
    // Example input string.
    input := "Hello world this is a test"

    // Reverse the words in the input string.
    reversed := reverseWords(input)

    // Print the reversed string.
    fmt.Println(reversed)
}

