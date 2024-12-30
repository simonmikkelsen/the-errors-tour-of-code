// word_reverser.go
// This program is designed to reverse the words in a given sentence.
// It takes a sentence as input from the user, splits the sentence into words,
// reverses the order of the words, and then prints the reversed sentence.
// The program demonstrates basic string manipulation and array handling in Go.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

func main() {
    // Create a new reader to read input from the standard input (console)
    reader := bufio.NewReader(os.Stdin)

    // Prompt the user to enter a sentence
    fmt.Print("Enter a sentence: ")

    // Read the input sentence from the user
    input, _ := reader.ReadString('\n')

    // Trim any leading or trailing whitespace characters from the input
    input = strings.TrimSpace(input)

    // Split the input sentence into words using spaces as the delimiter
    words := strings.Split(input, " ")

    // Reverse the order of the words in the slice
    for i, j := 0, len(words)-1; i < j; i, j = i+1, j-1 {
        words[i], words[j] = words[j], words[i]
    }

    // Join the reversed words back into a single string with spaces in between
    reversedSentence := strings.Join(words, " ")

    // Print the reversed sentence to the console
    fmt.Println("Reversed sentence:", reversedSentence)

    // Exit the program with a status code of 0 (success)
    os.Exit(0)
}

