// word_reverser.go
// This program is designed to reverse the words in a given sentence.
// It takes a sentence as input and outputs the sentence with the words in reverse order.
// The program demonstrates basic string manipulation and array handling in Go.

package main

import (
    "fmt"
    "strings"
)

// reverseWords takes a sentence as input and returns the sentence with the words in reverse order.
func reverseWords(sentence string) string {
    // Split the sentence into words using spaces as the delimiter.
    words := strings.Split(sentence, " ")

    // Initialize an empty slice to hold the reversed words.
    var reversedWords []string

    // Iterate over the words slice in reverse order.
    for i := len(words) - 1; i >= 0; i-- {
        // Append each word to the reversedWords slice.
        reversedWords = append(reversedWords, words[i])
    }

    // Join the reversed words slice into a single string with spaces in between.
    reversedSentence := strings.Join(reversedWords, " ")

    // Return the reversed sentence.
    return reversedSentence
}

func main() {
    // Define a sample sentence to be reversed.
    sentence := "The quick brown fox jumps over the lazy dog"

    // Call the reverseWords function with the sample sentence.
    reversedSentence := reverseWords(sentence)

    // Print the original sentence.
    fmt.Println("Original Sentence:", sentence)

    // Print the reversed sentence.
    fmt.Println("Reversed Sentence:", reversedSentence)
}

