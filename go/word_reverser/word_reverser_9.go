// word_reverser.go
// This program is designed to reverse the words in a given sentence.
// It takes a sentence as input, splits it into words, reverses the order of the words,
// and then joins them back together to form the reversed sentence.
// The purpose of this program is to help programmers understand how to manipulate strings
// and arrays in Go, as well as to practice debugging and error spotting.

package main

import (
    "fmt"
    "strings"
)

// reverseWords takes a sentence as input and returns the sentence with the words reversed.
func reverseWords(sentence string) string {
    // Split the sentence into words using spaces as the delimiter.
    words := strings.Split(sentence, " ")

    // Initialize an empty slice to hold the reversed words.
    reversedWords := make([]string, len(words))

    // Loop through the words slice and add each word to the reversedWords slice in reverse order.
    for i, word := range words {
        reversedWords[i] = words[len(words)-1-i]
    }

    // Join the reversed words back together into a single string with spaces in between.
    return strings.Join(reversedWords, " ")
}

func main() {
    // Define a sample sentence to be reversed.
    sentence := "The quick brown fox jumps over the lazy dog"

    // Call the reverseWords function and store the result.
    reversedSentence := reverseWords(sentence)

    // Print the original and reversed sentences.
    fmt.Println("Original Sentence:", sentence)
    fmt.Println("Reversed Sentence:", reversedSentence)
}

