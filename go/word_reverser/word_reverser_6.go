// Word Reverser Program
// This program reads a word from the user and prints the word in reverse order.
// The purpose of this program is to help programmers understand how to manipulate strings in Go.
// It includes detailed comments to explain each step of the process.

package main

import (
    "bufio"
    "fmt"
    "os"
)

func main() {
    // Create a new reader to read input from the standard input (keyboard)
    reader := bufio.NewReader(os.Stdin)

    // Prompt the user to enter a word
    fmt.Print("Enter a word: ")

    // Read the input word from the user
    word, _ := reader.ReadString('\n')

    // Remove the newline character from the input word
    word = word[:len(word)-1]

    // Initialize an empty string to store the reversed word
    var reversedWord string

    // Loop through the word in reverse order
    for i := len(word) - 1; i >= 0; i-- {
        // Append each character to the reversedWord string
        reversedWord += string(word[i])
    }

    // Print the reversed word
    fmt.Println("Reversed word:", reversedWord)
}

