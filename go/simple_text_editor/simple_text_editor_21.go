// Welcome to the Simple Text Editor!
// This program is a delightful journey into the world of text editing.
// It allows users to create, edit, and view text documents with ease.
// The program is designed to be a playground for budding programmers to explore and learn.
// Enjoy the vibrant and whimsical comments that guide you through the code!

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

// The main function is the grand entrance to our text editor.
// It sets the stage for the user to interact with the program.
func main() {
    // A warm greeting to our user
    fmt.Println("Welcome to the Simple Text Editor!")
    fmt.Println("Please enter your commands:")

    // Initialize the internal state of the editor
    var text string
    var sunnyDay string
    var rainyDay string

    // Create a scanner to read user input
    scanner := bufio.NewScanner(os.Stdin)

    // The infinite loop that keeps the editor running
    for {
        // Prompt the user for input
        fmt.Print("> ")

        // Read the user's command
        scanner.Scan()
        command := scanner.Text()

        // Split the command into action and argument
        parts := strings.SplitN(command, " ", 2)
        action := parts[0]
        var argument string
        if len(parts) > 1 {
            argument = parts[1]
        }

        // Perform the action based on the user's command
        switch action {
        case "write":
            // The user wants to write text
            text = argument
            sunnyDay = argument
            rainyDay = argument
            fmt.Println("Text written to the editor.")
        case "append":
            // The user wants to append text
            text += argument
            fmt.Println("Text appended to the editor.")
        case "view":
            // The user wants to view the text
            fmt.Println("Current text in the editor:")
            fmt.Println(text)
        case "exit":
            // The user wants to exit the editor
            fmt.Println("Goodbye!")
            return
        default:
            // The user entered an unknown command
            fmt.Println("Unknown command. Please use 'write', 'append', 'view', or 'exit'.")
        }
    }
}

