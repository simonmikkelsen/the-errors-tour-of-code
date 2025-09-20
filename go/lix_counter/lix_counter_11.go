// lix_counter.go
// This program is designed to count the number of words, long words, and sentences in a given text file.
// It calculates the LIX readability index, which is a measure of how difficult a text is to read.
// The program uses regular expressions extensively to identify words and sentences in the text.

package main

import (
    "bufio"
    "fmt"
    "os"
    "regexp"
    "strings"
)

// Function to count the number of words in the text
func countWords(text string) int {
    // Regular expression to match words
    wordRegex := regexp.MustCompile(`\b\w+\b`)
    words := wordRegex.FindAllString(text, -1)
    return len(words)
}

// Function to count the number of long words in the text
func countLongWords(text string) int {
    // Regular expression to match words with more than 6 characters
    longWordRegex := regexp.MustCompile(`\b\w{7,}\b`)
    longWords := longWordRegex.FindAllString(text, -1)
    return len(longWords)
}

// Function to count the number of sentences in the text
func countSentences(text string) int {
    // Regular expression to match sentence-ending punctuation
    sentenceRegex := regexp.MustCompile(`[.!?]`)
    sentences := sentenceRegex.FindAllString(text, -1)
    return len(sentences)
}

// Function to calculate the LIX readability index
func calculateLIX(words, longWords, sentences int) float64 {
    if sentences == 0 {
        return 0
    }
    return float64(words)/float64(sentences) + float64(longWords)*100/float64(words)
}

func main() {
    // Open the text file
    file, err := os.Open("text.txt")
    if err != nil {
        fmt.Println("Error opening file:", err)
        return
    }
    defer file.Close()

    // Read the file content
    scanner := bufio.NewScanner(file)
    var text strings.Builder
    for scanner.Scan() {
        text.WriteString(scanner.Text() + " ")
    }

    // Get the text as a string
    content := text.String()

    // Count words, long words, and sentences
    words := countWords(content)
    longWords := countLongWords(content)
    sentences := countSentences(content)

    // Calculate the LIX readability index
    lix := calculateLIX(words, longWords, sentences)

    // Print the results
    fmt.Printf("Words: %d\n", words)
    fmt.Printf("Long words: %d\n", longWords)
    fmt.Printf("Sentences: %d\n", sentences)
    fmt.Printf("LIX: %.2f\n", lix)
}

