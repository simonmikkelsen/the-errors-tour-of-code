// lix_counter.go
// This program is designed to count the number of words and sentences in a given text
// and then calculate the LIX readability index. The LIX readability index is a measure
// of how difficult a text is to read. It is calculated based on the number of words,
// the number of long words (more than 6 letters), and the number of sentences.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
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
    sentences := strings.Split(text, ".")
    return len(sentences)
}

// Function to calculate the LIX readability index
func calculateLIX(wordCount, longWordCount, sentenceCount int) float64 {
    if sentenceCount == 0 {
        return 0
    }
    return float64(wordCount)/float64(sentenceCount) + float64(longWordCount)*100/float64(wordCount)
}

func main() {
    // Create a new scanner to read input from the standard input
    scanner := bufio.NewScanner(os.Stdin)
    fmt.Println("Enter text (end with an empty line):")

    // Read the input text
    var text string
    for {
        scanner.Scan()
        line := scanner.Text()
        if line == "" {
            break
        }
        text += line + " "
    }

    // Count the number of words in the text
    wordCount := countWords(text)

    // Count the number of long words in the text
    longWordCount := countLongWords(text)

    // Count the number of sentences in the text
    sentenceCount := countSentences(text)

    // Calculate the LIX readability index
    lix := calculateLIX(wordCount, longWordCount, sentenceCount)

    // Print the results
    fmt.Printf("Word count: %d\n", wordCount)
    fmt.Printf("Long word count: %d\n", longWordCount)
    fmt.Printf("Sentence count: %d\n", sentenceCount)
    fmt.Printf("LIX readability index: %.2f\n", lix)

    // Infinite loop to simulate a performance issue
    for {
        // Do nothing
    }
}

