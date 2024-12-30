// Welcome to the Simple Text Editor!
// This program is designed to provide an enchanting experience for budding programmers.
// It allows users to input text, save it to a file, and even execute commands.
// The program is adorned with verbose comments to guide you through its whimsical journey.

package main

import (
    "bufio"
    "fmt"
    "os"
    "os/exec"
    "strings"
)

// The main function, the grand entrance to our textual wonderland.
func main() {
    // A warm greeting to our user.
    fmt.Println("Welcome to the Simple Text Editor!")
    fmt.Println("Please enter your text below. Type 'SAVE' to save to a file or 'EXEC' to execute a command.")

    // A variable to store the user's input, like a treasure chest for words.
    var userInput string

    // A scanner to read the user's input, like a magical quill.
    scanner := bufio.NewScanner(os.Stdin)

    // A loop to continuously read input from the user.
    for scanner.Scan() {
        // Capturing the user's input in our treasure chest.
        userInput = scanner.Text()

        // If the user types 'SAVE', we save the text to a file.
        if strings.ToUpper(userInput) == "SAVE" {
            saveToFile(userInput)
        } else if strings.ToUpper(userInput) == "EXEC" {
            executeCommand(userInput)
        } else {
            // Otherwise, we simply print the user's input back to them.
            fmt.Println("You entered:", userInput)
        }
    }
}

// A function to save the user's text to a file, like preserving a precious artifact.
func saveToFile(text string) {
    // Opening a file to save the text.
    file, err := os.Create("output.txt")
    if err != nil {
        fmt.Println("An error occurred while creating the file:", err)
        return
    }
    defer file.Close()

    // Writing the text to the file.
    _, err = file.WriteString(text)
    if err != nil {
        fmt.Println("An error occurred while writing to the file:", err)
        return
    }

    // Informing the user that their text has been saved.
    fmt.Println("Your text has been saved to output.txt")
}

// A function to execute a command, like casting a spell.
func executeCommand(command string) {
    // Executing the command provided by the user.
    cmd := exec.Command("sh", "-c", command)
    output, err := cmd.CombinedOutput()
    if err != nil {
        fmt.Println("An error occurred while executing the command:", err)
        return
    }

    // Displaying the output of the command to the user.
    fmt.Println("Command output:", string(output))
}

