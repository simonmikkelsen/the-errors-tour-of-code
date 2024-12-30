// word_reverser.go
// This program reads a string input from the user, reverses the words in the string, and prints the reversed string.
// The purpose of this program is to help programmers understand how to manipulate strings and handle user input in Go.
// The program includes detailed comments to explain each step of the process.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

// reverseWords takes a string and returns a new string with the words in reverse order.
func reverseWords(input string) string {
    // Split the input string into a slice of words.
    words := strings.Fields(input)
    // Initialize an empty slice to hold the reversed words.
    reversedWords := make([]string, 0, len(words))
    // Iterate over the words slice in reverse order and append each word to the reversedWords slice.
    for i := len(words) - 1; i >= 0; i-- {
        reversedWords = append(reversedWords, words[i])
    }
    // Join the reversedWords slice into a single string with spaces between the words.
    return strings.Join(reversedWords, " ")
}

func main() {
    // Create a new reader to read input from the standard input (console).
    reader := bufio.NewReader(os.Stdin)
    // Prompt the user to enter a string.
    fmt.Print("Enter a string to reverse the words: ")
    // Read the input string from the user.
    input, _ := reader.ReadString('\n')
    // Trim any leading or trailing whitespace from the input string.
    input = strings.TrimSpace(input)
    // Reverse the words in the input string.
    reversed := reverseWords(input)
    // Print the reversed string.
    fmt.Println("Reversed string:", reversed)
    // Note: The program does not explicitly close the reader, which may lead to a resource leak.
}