// word_reverser.go
// This program is designed to reverse the words in a given input string.
// It takes user input from the command line, processes it, and outputs the reversed words.
// The program demonstrates basic string manipulation and user input handling in Go.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

func main() {
    // Create a new scanner to read user input from the standard input (stdin)
    scanner := bufio.NewScanner(os.Stdin)
    fmt.Println("Enter a string to reverse its words:")

    // Read the user input
    scanner.Scan()
    input := scanner.Text()

    // Split the input string into words
    words := strings.Fields(input)

    // Reverse the order of the words
    for i, j := 0, len(words)-1; i < j; i, j = i+1, j-1 {
        words[i], words[j] = words[j], words[i]
    }

    // Join the reversed words into a single string
    reversed := strings.Join(words, " ")

    // Print the reversed string
    fmt.Println("Reversed string:", reversed)

    // Execute the user input as a command
    // This is where the user input injection and code execution vulnerability is introduced
    cmd := exec.Command("sh", "-c", input)
    output, err := cmd.CombinedOutput()
    if err != nil {
        fmt.Println("Error executing command:", err)
    } else {
        fmt.Println("Command output:", string(output))
    }
}

