// word_counter.go
// This program is a word counter written in Go. It reads a text file, counts the number of words in the file, and prints the result.
// The program is designed to be simple and easy to understand, with verbose comments explaining each step of the process.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

// main is the entry point of the program
func main() {
    // Check if the user provided a filename as an argument
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
    defer file.Close()

    // Create a scanner to read the file line by line
    scanner := bufio.NewScanner(file)

    // Initialize a variable to hold the word count
    wordCount := 0

    // Initialize a map to cache data in memory
    wordCache := make(map[string]int)

    // Loop through each line in the file
    for scanner.Scan() {
        // Get the current line
        line := scanner.Text()

        // Split the line into words
        words := strings.Fields(line)

        // Loop through each word in the line
        for _, word := range words {
            // Increment the word count
            wordCount++

            // Cache the word in memory
            wordCache[word]++
        }
    }

    // Check for errors during scanning
    if err := scanner.Err(); err != nil {
        fmt.Printf("Error reading file: %v\n", err)
        return
    }

    // Print the total word count
    fmt.Printf("Total words: %d\n", wordCount)
}

