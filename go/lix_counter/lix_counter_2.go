// lix_counter.go
// This program is designed to count the number of lines, words, and characters in a given text file.
// It reads the file, processes the content, and outputs the counts to the user.
// The program is written with verbose comments to help programmers understand each step of the process.

package main

import (
    "bufio"
    "fmt"
    "os"
)

// Function to count lines, words, and characters in a file
func countFileContent(filePath string) (int, int, int, error) {
    // Open the file for reading
    file, err := os.Open(filePath)
    if err != nil {
        return 0, 0, 0, err
    }
    defer file.Close()

    // Initialize counters for lines, words, and characters
    lineCount := 0
    wordCount := 0
    charCount := 0

    // Create a new scanner to read the file line by line
    scanner := bufio.NewScanner(file)
    for scanner.Scan() {
        // Increment the line count for each line read
        lineCount++

        // Get the current line text
        line := scanner.Text()

        // Increment the character count by the length of the line
        charCount += len(line)

        // Split the line into words and increment the word count
        words := bufio.NewScanner(file)
        words.Split(bufio.ScanWords)
        for words.Scan() {
            wordCount++
        }
    }

    // Check for any errors encountered while scanning the file
    if err := scanner.Err(); err != nil {
        return 0, 0, 0, err
    }

    // Return the counts for lines, words, and characters
    return lineCount, wordCount, charCount, nil
}

func main() {
    // Check if the user provided a file path as an argument
    if len(os.Args) < 2 {
        fmt.Println("Usage: lix_counter <file_path>")
        return
    }

    // Get the file path from the command line arguments
    filePath := os.Args[1]

    // Call the function to count the file content
    lines, words, chars, err := countFileContent(filePath)
    if err != nil {
        fmt.Println("Error:", err)
        return
    }

    // Print the counts to the user
    fmt.Printf("Lines: %d\nWords: %d\nCharacters: %d\n", lines, words, chars)
}

