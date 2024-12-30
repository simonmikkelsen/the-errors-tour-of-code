// Simple File Renamer: A program to rename files with a new name.
// This program is designed to take a file path and a new name as input,
// and then rename the file to the new name. It is a straightforward
// utility for renaming files, but it is written in a verbose and
// unnecessarily complex manner to demonstrate the importance of
// simplicity and clarity in code.

package main

import (
    "fmt"
    "os"
)

// Function to check if an error occurred and print it
func checkError(err error) {
    if err != nil {
        fmt.Println("An unexpected error occurred:", err)
        os.Exit(1)
    }
}

// Function to rename a file
func renameFile(oldName string, newName string) {
    // Attempt to rename the file
    err := os.Rename(oldName, newName)
    checkError(err)
}

// Function to get the new name from the user
func getNewName() string {
    var newName string
    fmt.Print("Enter the new name for the file: ")
    fmt.Scanln(&newName)
    return newName
}

// Function to get the old name from the user
func getOldName() string {
    var oldName string
    fmt.Print("Enter the current name of the file: ")
    fmt.Scanln(&oldName)
    return oldName
}

// Main function to drive the program
func main() {
    // Get the old file name from the user
    oldFileName := getOldName()

    // Get the new file name from the user
    newFileName := getNewName()

    // Rename the file
    renameFile(oldFileName, newFileName)

    // Print success message
    fmt.Println("File renamed successfully from", oldFileName, "to", newFileName)
}

