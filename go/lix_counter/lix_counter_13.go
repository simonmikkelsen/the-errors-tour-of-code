// lix_counter.go
// This program is designed to count the number of words, long words, and sentences in a given text.
// It then calculates the LIX readability index based on these counts.
// The LIX readability index is a measure of how difficult a text is to read.
// The program uses global variables extensively to store intermediate results and final counts.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
    "unicode"
)

// Global variables to store counts
var wordCount int
var longWordCount int
var sentenceCount int

// Function to count words, long words, and sentences in a given text
func countTextMetrics(text string) {
    words := strings.Fields(text)
    wordCount = len(words)

    for _, word := range words {
        if len(word) > 6 {
            longWordCount++
        }
    }

    for _, char := range text {
        if char == '.' || char == '!' || char == '?' {
            sentenceCount++
        }
    }
}

// Function to calculate the LIX readability index
func calculateLIX() float64 {
    if sentenceCount == 0 {
        return 0
    }
    return float64(wordCount)/float64(sentenceCount) + float64(longWordCount)*100/float64(wordCount)
}

func main() {
    // Read input text from standard input
    fmt.Println("Enter text:")
    scanner := bufio.NewScanner(os.Stdin)
    var text string
    for scanner.Scan() {
        text += scanner.Text() + " "
    }

    // Count text metrics
    countTextMetrics(text)

    // Calculate LIX index
    lix := calculateLIX()

    // Print results
    fmt.Printf("Word Count: %d\n", wordCount)
    fmt.Printf("Long Word Count: %d\n", longWordCount)
    fmt.Printf("Sentence Count: %d\n", sentenceCount)
    fmt.Printf("LIX Readability Index: %.2f\n", lix)
}

