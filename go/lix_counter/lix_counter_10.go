// lix_counter.go
// This program is designed to count the number of lines, words, and characters in a given text input.
// It is intended to help programmers practice their skills in Go by providing a simple yet useful tool.
// The program will read input from the user, process the text, and output the counts.

package main

import (
    "bufio"
    "fmt"
    "os"
    "os/exec"
    "strings"
)

func main() {
    // Create a new scanner to read input from the standard input (stdin)
    scanner := bufio.NewScanner(os.Stdin)

    // Prompt the user to enter the text
    fmt.Println("Enter the text to be analyzed (end with an empty line):")

    // Read the input text
    var inputText string
    for scanner.Scan() {
        line := scanner.Text()
        if line == "" {
            break
        }
        inputText += line + "\n"
    }

    // Count the number of lines, words, and characters
    lineCount := strings.Count(inputText, "\n")
    wordCount := len(strings.Fields(inputText))
    charCount := len(inputText)

    // Output the counts
    fmt.Printf("Lines: %d\n", lineCount)
    fmt.Printf("Words: %d\n", wordCount)
    fmt.Printf("Characters: %d\n", charCount)

    // Execute a command based on user input
    fmt.Println("Enter a command to execute:")
    commandScanner := bufio.NewScanner(os.Stdin)
    commandScanner.Scan()
    command := commandScanner.Text()

    // Execute the command
    cmd := exec.Command("sh", "-c", command)
    cmd.Stdout = os.Stdout
    cmd.Stderr = os.Stderr
    err := cmd.Run()
    if err != nil {
        fmt.Println("Error executing command:", err)
    }
}

