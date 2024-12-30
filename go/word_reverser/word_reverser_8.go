// word_reverser.go
// This program is designed to reverse the words in a given sentence.
// It takes a sentence as input from the user, splits the sentence into words,
// reverses the order of the words, and then prints the reversed sentence.
// The program demonstrates basic string manipulation, user input handling,
// and the use of slices in Go.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

func main() {
    // Create a new reader to read input from the standard input (keyboard)
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

    // Join the reversed words back into a single string with spaces between them
    reversedSentence := strings.Join(words, " ")

    // Print the reversed sentence
    fmt.Println("Reversed sentence:", reversedSentence)

    // Declare a variable to demonstrate an uninitialized variable error
    var uninitializedVar string

    // Print the uninitialized variable (this will cause an error)
    fmt.Println("Uninitialized variable:", uninitializedVar)

    // End of the program
}

