// Lix Counter is a program designed to calculate the LIX readability index of a given text.
// The LIX readability index is a measure of how difficult a text is to read.
// It is calculated based on the number of words, the number of long words (more than 6 letters),
// and the number of sentences in the text. This program will read input text from the user,
// process it to count the necessary components, and then compute and display the LIX index.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
    "unicode"
)

// Function to count the number of words in a given text
func countWords(text string) int {
    words := strings.Fields(text)
    return len(words)
}

// Function to count the number of long words (more than 6 letters) in a given text
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

// Function to count the number of sentences in a given text
func countSentences(text string) int {
    sentenceCount := 0
    for _, char := range text {
        if char == '.' || char == '!' || char == '?' {
            sentenceCount++
        }
    }
    return sentenceCount
}

// Function to calculate the LIX readability index
func calculateLix(words, longWords, sentences int) float64 {
    if sentences == 0 {
        return 0
    }
    return float64(words)/float64(sentences) + float64(longWords*100)/float64(words)
}

func main() {
    // Create a new scanner to read input from the standard input
    scanner := bufio.NewScanner(os.Stdin)
    fmt.Println("Enter the text to analyze:")

    // Read the input text from the user
    scanner.Scan()
    text := scanner.Text()

    // Count the number of words in the input text
    words := countWords(text)

    // Count the number of long words in the input text
    longWords := countLongWords(text)

    // Count the number of sentences in the input text
    sentences := countSentences(text)

    // Calculate the LIX readability index
    lix := calculateLix(words, longWords, sentences)

    // Display the LIX readability index
    fmt.Printf("LIX readability index: %.2f\n", lix)
}

