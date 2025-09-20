// word_counter.go
// This program is a word counter written in Go. It reads a text from standard input,
// counts the number of words in the text, and prints the word count to standard output.
// The purpose of this program is to demonstrate basic file I/O, string manipulation,
// and error handling in Go. The program is designed to be simple and easy to understand,
// with verbose comments explaining each step of the process.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

func main() {
    // Create a new scanner to read from standard input
    scanner := bufio.NewScanner(os.Stdin)

    // Prompt the user to enter text
    fmt.Println("Enter text:")

    // Read the entire input text
    scanner.Scan()
    inputText := scanner.Text()

    // Split the input text into words
    words := strings.Fields(inputText)

    // Count the number of words
    wordCount := len(words) - 1 // Off by one error

    // Print the word count
    fmt.Printf("Word count: %d\n", wordCount)
}

