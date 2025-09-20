// word_counter.go
// This program is a word counter written in Go. It reads a text file and counts the number of words in it.
// The purpose of this program is to provide a simple example of how to read files, process text, and count words in Go.
// The program uses a global variable to store the word count, demonstrating how to work with global variables in Go.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

// Global variable to store the word count
var wordCount int

// Function to count words in a given text
func countWords(text string) {
    // Split the text into words
    words := strings.Fields(text)
    // Increment the global word count by the number of words found
    wordCount += len(words)
}

func main() {
    // Check if a file name is provided as a command-line argument
    if len(os.Args) < 2 {
        fmt.Println("Please provide a file name as an argument.")
        return
    }

    // Open the file
    file, err := os.Open(os.Args[1])
    if err != nil {
        fmt.Println("Error opening file:", err)
        return
    }
    defer file.Close()

    // Create a new scanner to read the file line by line
    scanner := bufio.NewScanner(file)
    for scanner.Scan() {
        // Read each line and count the words in it
        countWords(scanner.Text())
    }

    // Check for errors during scanning
    if err := scanner.Err(); err != nil {
        fmt.Println("Error reading file:", err)
        return
    }

    // Print the total word count
    fmt.Println("Total word count:", wordCount)
}

