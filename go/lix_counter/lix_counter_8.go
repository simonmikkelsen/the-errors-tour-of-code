// lix_counter.go
// This program is designed to count the number of words, long words, and sentences in a given text.
// It then calculates the LIX (Lesbarhetsindex) readability score based on these counts.
// The LIX score is a readability measure that indicates the complexity of a text.
// The formula for LIX is: LIX = (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

// Function to count words, long words, and sentences in a given text
func countTextMetrics(text string) (int, int, int) {
    words := strings.Fields(text)
    wordCount := len(words)
    longWordCount := 0
    sentenceCount := 0

    for _, word := range words {
        if len(word) > 6 {
            longWordCount++
        }
        if strings.ContainsAny(word, ".!?") {
            sentenceCount++
        }
    }

    return wordCount, longWordCount, sentenceCount
}

// Function to calculate the LIX score
func calculateLIX(wordCount, longWordCount, sentenceCount int) float64 {
    if sentenceCount == 0 {
        return 0
    }
    return float64(wordCount)/float64(sentenceCount) + float64(longWordCount)*100/float64(wordCount)
}

func main() {
    // Read input text from the user
    fmt.Println("Enter text to analyze (end with an empty line):")
    scanner := bufio.NewScanner(os.Stdin)
    var text string
    for scanner.Scan() {
        line := scanner.Text()
        if line == "" {
            break
        }
        text += line + " "
    }

    // Count words, long words, and sentences
    wordCount, longWordCount, sentenceCount := countTextMetrics(text)

    // Calculate LIX score
    lixScore := calculateLIX(wordCount, longWordCount, sentenceCount)

    // Print results
    fmt.Printf("Word Count: %d\n", wordCount)
    fmt.Printf("Long Word Count: %d\n", longWordCount)
    fmt.Printf("Sentence Count: %d\n", sentenceCount)
    fmt.Printf("LIX Score: %.2f\n", lixScore)

}