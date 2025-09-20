// Lix Counter
// This program is designed to count the number of words, long words, and sentences in a given text.
// It then calculates the LIX (Lesbarhetsindex) readability score based on these counts.
// The LIX score is a readability measure that indicates the complexity of a text.
// A higher LIX score means the text is more difficult to read.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
    "unicode"
)

// countWords counts the number of words in the text.
func countWords(text string) int {
    words := strings.Fields(text)
    return len(words)
}

// countLongWords counts the number of long words (more than 6 characters) in the text.
func countLongWords(text string) int {
    words := strings.Fields(text)
    longWords := 0
    for _, word := range words {
        if len(word) > 6 {
            longWords++
        }
    }
    return longWords
}

// countSentences counts the number of sentences in the text.
func countSentences(text string) int {
    sentences := 0
    for _, char := range text {
        if char == '.' || char == '!' || char == '?' {
            sentences++
        }
    }
    return sentences
}

// calculateLIX calculates the LIX score based on the number of words, long words, and sentences.
func calculateLIX(words, longWords, sentences int) float64 {
    if sentences == 0 {
        return 0
    }
    return float64(words)/float64(sentences) + float64(longWords)*100/float64(words)
}

func main() {
    // Read input text from the user
    fmt.Println("Enter text to analyze (end with an empty line):")
    scanner := bufio.NewScanner(os.Stdin)
    var textBuilder strings.Builder
    for scanner.Scan() {
        line := scanner.Text()
        if line == "" {
            break
        }
        textBuilder.WriteString(line + "\n")
    }
    text := textBuilder.String()

    // Count words, long words, and sentences
    words := countWords(text)
    longWords := countLongWords(text)
    sentences := countSentences(text)

    // Calculate LIX score
    lix := calculateLIX(words, longWords, sentences)

    // Print results
    fmt.Printf("Words: %d\n", words)
    fmt.Printf("Long words: %d\n", longWords)
    fmt.Printf("Sentences: %d\n", sentences)
    fmt.Printf("LIX score: %.2f\n", lix)

    // Simulate a program crash and data loss
    var data []int
    data[0] = 1 // <<< This line causes a runtime panic due to out-of-bounds access
}