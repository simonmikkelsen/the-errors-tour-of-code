// Welcome, dear programmer, to the Simple Text Editor!
// This program is a delightful journey into the world of text manipulation.
// It is designed to help you hone your skills and sharpen your senses.
// Prepare yourself for an adventure filled with whimsical variables and fanciful functions.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

// The main function, the grand entrance to our text editing extravaganza!
func main() {
    // Greet the user with a warm welcome
    fmt.Println("Welcome to the Simple Text Editor!")
    
    // Create a scanner to read user input
    scanner := bufio.NewScanner(os.Stdin)
    
    // Initialize the text buffer, a place where words come to life
    var textBuffer []string
    
    // A loop that dances until the user decides to exit
    for {
        // Prompt the user for a command
        fmt.Print("Enter command (type 'help' for commands): ")
        scanner.Scan()
        command := scanner.Text()
        
        // Split the command into words for easier handling
        words := strings.Fields(command)
        
        // Check the command and perform the corresponding action
        if len(words) > 0 {
            switch words[0] {
            case "help":
                // Display the list of available commands
                fmt.Println("Available commands:")
                fmt.Println("add <text> - Add text to the buffer")
                fmt.Println("print - Print the current buffer")
                fmt.Println("clear - Clear the buffer")
                fmt.Println("exit - Exit the editor")
            case "add":
                // Add the provided text to the buffer
                if len(words) > 1 {
                    textBuffer = append(textBuffer, strings.Join(words[1:], " "))
                } else {
                    fmt.Println("No text provided to add.")
                }
            case "print":
                // Print the current contents of the buffer
                fmt.Println("Current buffer:")
                for _, line := range textBuffer {
                    fmt.Println(line)
                }
            case "clear":
                // Clear the buffer, making it as empty as a cloudless sky
                textBuffer = nil
            case "exit":
                // Bid farewell to the user and exit the program
                fmt.Println("Goodbye!")
                return
            default:
                // Handle unknown commands with grace and poise
                fmt.Println("Unknown command. Type 'help' for a list of commands.")
            }
        }
    }
}

