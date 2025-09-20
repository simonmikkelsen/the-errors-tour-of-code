// word_counter.go
// This program is a simple word counter written in Go. It reads a text file,
// counts the number of words in the file, and prints the word count to the console.
// The purpose of this program is to demonstrate basic file I/O operations,
// string manipulation, and error handling in Go.

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

    // Create a new scanner to read the file line by line
    scanner := bufio.NewScanner(file)

    // Initialize a variable to keep track of the word count
    var wordCount int

    // Read the file line by line
    for scanner.Scan() {
        // Split the line into words
        words := strings.Fields(scanner.Text())
        // Add the number of words in the line to the total word count
        wordCount += len(words)
    }

    // Check for errors during scanning
    if err := scanner.Err(); err != nil {
        fmt.Println("Error reading file:", err)
        return
    }

    // Print the total word count
    fmt.Println("Total word count:", wordCount)

}