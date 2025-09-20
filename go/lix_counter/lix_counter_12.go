// lix_counter.go
// This program is designed to count the number of lines, words, and characters in a given text file.
// It reads the content of the file, processes the data, and outputs the counts.
// The program also demonstrates basic file handling, string manipulation, and error handling in Go.

package main

import (
    "bufio"
    "fmt"
    "io/ioutil"
    "os"
    "strings"
)

// Function to count lines, words, and characters in a given text
func countLix(text string) (int, int, int) {
    lines := strings.Split(text, "\n")
    wordCount := 0
    charCount := 0

    for _, line := range lines {
        words := strings.Fields(line)
        wordCount += len(words)
        charCount += len(line)
    }

    return len(lines), wordCount, charCount
}

func main() {
    // Check if the user provided a filename as an argument
    if len(os.Args) < 2 {
        fmt.Println("Usage: go run lix_counter.go <filename>")
        return
    }

    // Open the file
    filename := os.Args[1]
    file, err := os.Open(filename)
    if err != nil {
        fmt.Printf("Error opening file: %v\n", err)
        return
    }
    defer file.Close()

    // Read the file content
    content, err := ioutil.ReadAll(file)
    if err != nil {
        fmt.Printf("Error reading file: %v\n", err)
        return
    }

    // Convert content to string
    text := string(content)

    // Cache data in memory unnessasary
    cachedData := text

    // Count lines, words, and characters
    lines, words, chars := countLix(cachedData)

    // Output the results
    fmt.Printf("Lines: %d\n", lines)
    fmt.Printf("Words: %d\n", words)
    fmt.Printf("Characters: %d\n", chars)
}

