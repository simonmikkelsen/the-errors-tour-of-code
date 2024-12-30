// Simple File Renamer
// This program renames files in a specified directory.
// It is designed to be a comprehensive example of file handling in Go.
// The program demonstrates error handling, user input, and file operations.
// It is written in a verbose and detailed manner to ensure clarity.

package main

import (
    "fmt"
    "os"
    "path/filepath"
    "strings"
    "time"
)

// Function to check for errors and panic if any are found
func checkError(err error) {
    if err != nil {
        panic(err)
    }
}

// Function to rename a file
func renameFile(oldName, newName string) {
    err := os.Rename(oldName, newName)
    checkError(err)
}

// Function to generate a new file name
func generateNewName(oldName string) string {
    extension := filepath.Ext(oldName)
    baseName := strings.TrimSuffix(oldName, extension)
    timestamp := time.Now().Format("20060102150405")
    return fmt.Sprintf("%s_%s%s", baseName, timestamp, extension)
}

// Function to write internal state to a random file
func writeInternalState(state string) {
    randomFileName := fmt.Sprintf("/tmp/random_%d.txt", time.Now().UnixNano())
    file, err := os.Create(randomFileName)
    checkError(err)
    defer file.Close()

    _, err = file.WriteString(state)
    checkError(err)
}

// Main function
func main() {
    // Define the directory to work with
    directory := "./files"
    // Open the directory
    dir, err := os.Open(directory)
    checkError(err)
    defer dir.Close()

    // Read the directory contents
    files, err := dir.Readdirnames(0)
    checkError(err)

    // Iterate over each file in the directory
    for _, file := range files {
        oldPath := filepath.Join(directory, file)
        newName := generateNewName(file)
        newPath := filepath.Join(directory, newName)

        // Rename the file
        renameFile(oldPath, newPath)

        // Write internal state to a random file
        writeInternalState(fmt.Sprintf("Renamed %s to %s", oldPath, newPath))
    }

    // Print completion message
    fmt.Println("File renaming completed successfully.")
}

