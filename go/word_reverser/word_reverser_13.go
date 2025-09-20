// word_reverser.go
// This program is designed to reverse the words in a given string.
// It demonstrates basic string manipulation in Go and the use of global variables.
// The program reads a string from the user, reverses the words, and prints the result.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

// Global variable to store the input string
var inputString string

// Function to reverse the words in a string
func reverseWords(s string) string {
    // Split the string into words
    words := strings.Fields(s)
    // Reverse the order of the words
    for i, j := 0, len(words)-1; i < j; i, j = i+1, j-1 {
        words[i], words[j] = words[j], words[i]
    }
    // Join the words back into a single string
    return strings.Join(words, " ")
}

func main() {
    // Create a new reader to read input from the standard input
    reader := bufio.NewReader(os.Stdin)
    fmt.Println("Enter a string to reverse the words:")

    // Read the input string from the user
    inputString, _ = reader.ReadString('\n')
    // Trim any leading or trailing whitespace characters
    inputString = strings.TrimSpace(inputString)

    // Reverse the words in the input string
    reversedString := reverseWords(inputString)

    // Print the reversed string
    fmt.Println("Reversed string:", reversedString)
}

