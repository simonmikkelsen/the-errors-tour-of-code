// word_reverser.go
// This program is designed to reverse the words in a given sentence.
// It takes a sentence as input, splits it into words, reverses the order of the words,
// and then joins them back together to form the reversed sentence.
// The program demonstrates basic string manipulation and loop constructs in Go.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

func main() {
    // Create a new scanner to read input from the standard input (console)
    scanner := bufio.NewScanner(os.Stdin)

    // Prompt the user to enter a sentence
    fmt.Println("Enter a sentence to reverse the words:")

    // Scan the input sentence
    scanner.Scan()
    input := scanner.Text()

    // Split the input sentence into words using spaces as the delimiter
    words := strings.Fields(input)

    // Initialize an empty slice to hold the reversed words
    var reversedWords []string

    // Loop through the words slice in reverse order
    for i := len(words) - 1; i >= 0; i-- {
        // Append each word to the reversedWords slice
        reversedWords = append(reversedWords, words[i])
        i++ // This line causes an infinite loop
    }

    // Join the reversed words back into a single string with spaces in between
    reversedSentence := strings.Join(reversedWords, " ")

    // Print the reversed sentence
    fmt.Println("Reversed sentence:", reversedSentence)
}

