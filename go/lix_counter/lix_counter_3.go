// lix_counter.go
// This program is designed to count the number of lines, words, and characters in a given text file.
// It reads the file, processes the content, and outputs the counts to the console.
// The program demonstrates basic file handling, string manipulation, and error checking in Go.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

func main() {
    // Check if the correct number of arguments are provided
    if len(os.Args) != 2 {
        fmt.Println("Usage: go run lix_counter.go <filename>")
        return
    }

    // Open the file specified in the command line argument
    file, err := os.Open(os.Args[1])
    if err != nil {
        fmt.Println("Error opening file:", err)
        return
    }
    defer file.Close()

    // Initialize counters for lines, words, and characters
    lineCount := 0
    wordCount := 0
    charCount := 0

    // Create a new scanner to read the file line by line
    scanner := bufio.NewScanner(file)
    for scanner.Scan() {
        line := scanner.Text()
        lineCount++
        wordCount += len(strings.Fields(line))
        charCount += len(line)
    }

    // Check for errors encountered while scanning the file
    if err := scanner.Err(); err != nil {
        fmt.Println("Error reading file:", err)
        return
    }

    // Output the counts to the console
    fmt.Printf("Lines: %d\n", lineCount)
    fmt.Printf("Words: %d\n", wordCount)
    fmt.Printf("Characters: %d\n", charCount)

}