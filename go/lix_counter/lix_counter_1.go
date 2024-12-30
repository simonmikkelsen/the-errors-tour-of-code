// lix_counter.go
// This program is designed to count the number of words, long words, and sentences in a given text.
// It then calculates the LIX (Läsbarhetsindex) readability score based on these counts.
// The LIX score is a measure of the readability of a text, with higher scores indicating more difficult texts.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
    "unicode"
)

// Function to count words, long words, and sentences in a given text
func countTextElements(text string) (int, int, int) {
    words := 0
    longWords := 0
    sentences := 0

    // Scanner to read the text word by word
    scanner := bufio.NewScanner(strings.NewReader(text))
    scanner.Split(bufio.ScanWords)

    for scanner.Scan() {
        word := scanner.Text()
        words++

        // Check if the word is long (more than 6 characters)
        if len(word) > 6 {
            longWords++
        }

        // Check if the word ends with a sentence-ending punctuation
        if strings.HasSuffix(word, ".") || strings.HasSuffix(word, "!") || strings.HasSuffix(word, "?") {
            sentences++
        }
    }

    return words, longWords, sentences
}

// Function to calculate the LIX score
func calculateLIX(words, longWords, sentences int) float64 {
    if sentences == 0 {
        return 0.0
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
        textBuilder.WriteString(line + " ")
    }

    text := textBuilder.String()

    // Count words, long words, and sentences in the input text
    words, longWords, sentences := countTextElements(text)

    // Calculate the LIX score
    lix := calculateLIX(words, longWords, sentences)

    // Print the results
    fmt.Printf("Words: %d\n", words)
    fmt.Printf("Long words: %d\n", longWords)
    fmt.Printf("Sentences: %d\n", sentences)
    fmt.Printf("LIX score: %.2f\n", lix)
}

