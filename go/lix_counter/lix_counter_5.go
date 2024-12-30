// lix_counter.go
// This program is designed to count the number of words, long words, and sentences in a given text.
// It then calculates the LIX (Lesbarhetsindex) readability score based on these counts.
// The LIX score is a measure of the complexity of a text, with higher scores indicating more complex texts.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

// Function to count the number of words in a text
func countWords(text string) int {
    words := strings.Fields(text)
    return len(words)
}

// Function to count the number of long words (more than 6 characters) in a text
func countLongWords(text string) int {
    words := strings.Fields(text)
    longWordCount := 0
    for _, word := range words {
        if len(word) > 6 {
            longWordCount++
        }
    }
    return longWordCount
}

// Function to count the number of sentences in a text
func countSentences(text string) int {
    sentences := strings.Split(text, ".")
    return len(sentences)
}

// Function to calculate the LIX score
func calculateLIX(text string) float64 {
    wordCount := countWords(text)
    longWordCount := countLongWords(text)
    sentenceCount := countSentences(text)

    // LIX formula: (number of words / number of sentences) + (number of long words * 100 / number of words)
    lix := float64(wordCount)/float64(sentenceCount) + (float64(longWordCount) * 100 / float64(wordCount))
    return lix
}

func main() {
    // Read input text from the user
    fmt.Println("Enter the text to analyze:")
    scanner := bufio.NewScanner(os.Stdin)
    scanner.Scan()
    text := scanner.Text()

    // Calculate and print the LIX score
    lix := calculateLIX(text)
    fmt.Printf("The LIX score of the entered text is: %.2f\n", lix)
}

