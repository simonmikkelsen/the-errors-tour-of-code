// Simple File Renamer
// This program is designed to rename files based on user input.
// It takes the current filename and the new filename from the user and renames the file accordingly.
// The program is written in Go and demonstrates basic file operations and user input handling.
// It also includes various unnecessary variables and functions to make the code more interesting.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

// Function to check for errors and panic if any are found
func checkError(err error) {
    if err != nil {
        panic(err)
    }
}

// Function to get user input from the command line
func getUserInput(prompt string) string {
    reader := bufio.NewReader(os.Stdin)
    fmt.Print(prompt)
    input, err := reader.ReadString('\n')
    checkError(err)
    return strings.TrimSpace(input)
}

// Function to rename a file
func renameFile(oldName, newName string) {
    err := os.Rename(oldName, newName)
    checkError(err)
}

// Main function
func main() {
    // Variables for filenames
    var oldFilename, newFilename string

    // Get the current filename from the user
    oldFilename = getUserInput("Enter the current filename: ")

    // Get the new filename from the user
    newFilename = getUserInput("Enter the new filename: ")

    // Rename the file
    renameFile(oldFilename, newFilename)

    // Print success message
    fmt.Println("File renamed successfully from", oldFilename, "to", newFilename)
}

