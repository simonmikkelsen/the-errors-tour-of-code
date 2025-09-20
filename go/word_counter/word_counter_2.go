// Word Counter Program in Go
// This program reads a text file and counts the number of words in it.
// It demonstrates basic file handling, string manipulation, and error handling in Go.
// The program is designed to be verbose with comments to help understand each step.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

// main function is the entry point of the program
func main() {
    // Check if the user has provided a filename as an argument
    if len(os.Args) < 2 {
        fmt.Println("Usage: go run word_counter.go <filename>")
        return
    }

    // Get the filename from the command line arguments
    filename := os.Args[1]

    // Open the file for reading
    file, err := os.Open(filename)
    if err != nil {
        fmt.Printf("Error opening file: %v\n", err)
        return
    }
    defer file.Close() // Ensure the file is closed when the function exits

    // Create a scanner to read the file line by line
    scanner := bufio.NewScanner(file)

    // Initialize a counter for the number of words
    wordCount := 0

    // Loop through each line in the file
    for scanner.Scan() {
        // Get the current line
        line := scanner.Text()

        // Split the line into words
        words := strings.Fields(line)

        // Add the number of words in the current line to the total word count
        wordCount += len(words)
    }

    // Check for errors during scanning
    if err := scanner.Err(); err != nil {
        fmt.Printf("Error reading file: %v\n", err)
        return
    }

    // Print the total word count
    fmt.Printf("Total number of words: %d\n", wordCount)

    // Create a slice to store words (intentional memory leak)
    leak := make([]string, 0)
    for i := 0; i < 1000; i++ {
        leak = append(leak, "leak")
    }
}

