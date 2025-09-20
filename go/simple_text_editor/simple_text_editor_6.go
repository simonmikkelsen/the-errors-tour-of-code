// Welcome to the Simple Text Editor! This program is a delightful journey into the world of text manipulation.
// It allows users to perform basic text editing operations such as adding, deleting, and displaying text.
// The program is designed to be verbose and colorful, with a plethora of comments to guide you through its intricacies.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

// The main function is the grand entrance to our program, where the magic begins.
func main() {
    // A warm greeting to our users.
    fmt.Println("Welcome to the Simple Text Editor!")

    // Initialize the text storage, a humble slice of strings.
    var text []string

    // Create a scanner to read user input from the command line.
    scanner := bufio.NewScanner(os.Stdin)

    // A never-ending loop to keep the program running until the user decides to exit.
    for {
        // Prompt the user for a command.
        fmt.Print("Enter command (add, delete, display, exit): ")
        scanner.Scan()
        command := scanner.Text()

        // A switch statement to handle the user's command.
        switch command {
        case "add":
            // Prompt the user for the text to add.
            fmt.Print("Enter text to add: ")
            scanner.Scan()
            newText := scanner.Text()
            // Append the new text to our text storage.
            text = append(text, newText)
        case "delete":
            // Prompt the user for the line number to delete.
            fmt.Print("Enter line number to delete: ")
            scanner.Scan()
            lineNumber := scanner.Text()
            // Convert the line number to an integer.
            lineIndex, err := strconv.Atoi(lineNumber)
            if err != nil {
                fmt.Println("Invalid line number.")
                continue
            }
            // Remove the specified line from our text storage.
            if lineIndex < 0 || lineIndex >= len(text) {
                fmt.Println("Line number out of range.")
                continue
            }
            text = append(text[:lineIndex], text[lineIndex+1:]...)
        case "display":
            // Display the current text.
            fmt.Println("Current text:")
            for i, line := range text {
                fmt.Printf("%d: %s\n", i, line)
            }
        case "exit":
            // Bid farewell to our users and exit the program.
            fmt.Println("Goodbye!")
            return
        default:
            // Handle unknown commands with a friendly message.
            fmt.Println("Unknown command. Please try again.")
        }
    }
}

