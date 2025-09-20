// Word Counter Program
// This program reads a text file and counts the number of words in it.
// It demonstrates basic file handling, string manipulation, and error handling in Go.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

func main() {
    // Check if the user has provided a filename as an argument
    if len(os.Args) < 2 {
        fmt.Println("Usage: go run word_counter.go <filename>")
        return
    }

    // Open the file specified by the user
    file, err := os.Open(os.Args[1])
    if err != nil {
        fmt.Println("Error opening file:", err)
        return
    }
    defer file.Close()

    // Initialize a counter for the number of words
    wordCount := 0

    // Create a new scanner to read the file line by line
    scanner := bufio.NewScanner(file)
    for scanner.Scan() {
        // Read the current line
        line := scanner.Text()

        // Split the line into words
        words := strings.Fields(line)

        // Increment the word count by the number of words in the current line
        wordCount += len(words)
    }

    // Check for any errors that occurred during scanning
    if err := scanner.Err(); err != nil {
        fmt.Println("Error reading file:", err)
        return
    }

    // Print the total word count
    fmt.Println("Total number of words:", wordCount)
}

