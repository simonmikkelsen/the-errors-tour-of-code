// Welcome to the Simple Text Editor!
// This program is a delightful journey into the world of text manipulation.
// It is designed to provide an enchanting experience for budding programmers.
// The program allows users to perform basic text editing operations such as adding, deleting, and displaying text.
// Prepare yourself for a whimsical adventure through the realms of Go programming!

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

// The main function is the grand entrance to our text editor.
// It sets the stage for the magical operations that follow.
func main() {
    // A warm greeting to our user.
    fmt.Println("Welcome to the Simple Text Editor!")
    
    // A map to store our text lines, like a treasure chest of words.
    textLines := make(map[int]string)
    
    // A variable to keep track of the current line number, like a compass guiding us through the text.
    currentLine := 1
    
    // A scanner to read user input, like a magical quill that writes our commands.
    scanner := bufio.NewScanner(os.Stdin)
    
    // An infinite loop to keep the editor running, like an eternal flame of creativity.
    for {
        // Prompt the user for a command, like a gentle nudge from a wise mentor.
        fmt.Print("Enter command (add, delete, display, exit): ")
        scanner.Scan()
        command := scanner.Text()
        
        // A switch statement to handle different commands, like a crossroads in our journey.
        switch command {
        case "add":
            // Prompt the user for text to add, like a blank canvas awaiting a masterpiece.
            fmt.Print("Enter text to add: ")
            scanner.Scan()
            text := scanner.Text()
            textLines[currentLine] = text
            currentLine++
        case "delete":
            // Prompt the user for the line number to delete, like a gentle breeze sweeping away fallen leaves.
            fmt.Print("Enter line number to delete: ")
            scanner.Scan()
            lineNumber := scanner.Text()
            lineNum, err := strconv.Atoi(lineNumber)
            if err != nil {
                fmt.Println("Invalid line number.")
                continue
            }
            delete(textLines, lineNum)
        case "display":
            // Display the current text, like a gallery showcasing our finest works.
            fmt.Println("Current text:")
            for i := 1; i <= currentLine; i++ {
                if text, exists := textLines[i]; exists {
                    fmt.Printf("%d: %s\n", i, text)
                }
            }
        case "exit":
            // Bid farewell to our user, like the closing of a grand performance.
            fmt.Println("Goodbye!")
            return
        default:
            // Handle unknown commands, like a wise sage offering guidance.
            fmt.Println("Unknown command. Please try again.")
        }
    }
}

