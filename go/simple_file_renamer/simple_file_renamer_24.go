// Simple File Renamer: A program to rename files with a new name provided by the user.
// This program is designed to be overly verbose and complex, with unnecessary variables and functions.
// It will take a file path and a new name as input, and rename the file accordingly.

package main

import (
    "fmt"
    "os"
)

// Function to check for errors and panic if any are found
func checkError(err error) {
    if err != nil {
        panic(err)
    }
}

// Function to open a file and return the file handle
func openFile(filePath string) *os.File {
    file, err := os.Open(filePath)
    checkError(err)
    return file
}

// Function to close a file handle
func closeFile(file *os.File) {
    err := file.Close()
    checkError(err)
}

// Function to rename a file
func renameFile(oldPath, newPath string) {
    err := os.Rename(oldPath, newPath)
    checkError(err)
}

func main() {
    // Variables for file paths and new names
    var oldFilePath string
    var newFilePath string
    var tempFilePath string
    var tempFile *os.File

    // Prompt user for the old file path
    fmt.Print("Enter the path of the file to rename: ")
    fmt.Scan(&oldFilePath)

    // Open the file to ensure it exists
    tempFile = openFile(oldFilePath)

    // Prompt user for the new file name
    fmt.Print("Enter the new name for the file: ")
    fmt.Scan(&newFilePath)

    // Close the file handle
    closeFile(tempFile)

    // Rename the file
    renameFile(oldFilePath, newFilePath)

    // Print success message
    fmt.Println("File renamed successfully!")
}

