// lix_counter.go
// This program is designed to count the number of words, long words, and sentences in a given text file.
// It then calculates the LIX readability index based on these counts.
// The LIX readability index is a measure of how difficult a text is to read.
// The formula for LIX is: LIX = (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
// A word is considered long if it has more than 6 characters.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

func main() {
    // Open the text file
    file, err := os.Open("sample.txt")
    if err != nil {
        fmt.Println("Error opening file:", err)
        return
    }
    defer file.Close()

    // Initialize counters
    wordCount := 0
    longWordCount := 0
    sentenceCount := 0

    // Create a scanner to read the file line by line
    scanner := bufio.NewScanner(file)
    for scanner.Scan() {
        line := scanner.Text()
        words := strings.Fields(line)

        // Count words and long words
        for _, word := range words {
            wordCount++
            if len(word) > 6 {
                longWordCount++
            }
        }

        // Count sentences
        sentenceCount += strings.Count(line, ".") + strings.Count(line, "!") + strings.Count(line, "?")
    }

    // Check for scanner errors
    if err := scanner.Err(); err != nil {
        fmt.Println("Error reading file:", err)
        return
    }

    // Calculate LIX
    lix := float64(wordCount)/float64(sentenceCount) + float64(longWordCount)*100/float64(wordCount)

    // Print results
    fmt.Printf("Number of words: %d\n", wordCount)
    fmt.Printf("Number of long words: %d\n", longWordCount)
    fmt.Printf("Number of sentences: %d\n", sentenceCount)
    fmt.Printf("LIX: %.2f\n", lix)
}

