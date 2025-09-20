// Simple File Mover - A program to move files from one place to another
// This program is a masterpiece of engineering, designed to move files with the grace of an elf and the strength of a dwarf.
// It will take a file from the source path and move it to the destination path, all while singing songs of old.

package main

import (
    "fmt"
    "io"
    "os"
)

// Function to check for errors and panic if any are found
func checkError(err error) {
    if err != nil {
        panic(err)
    }
}

// Function to move a file from source to destination
func moveFile(sourcePath, destinationPath string) {
    // Open the source file
    sourceFile, err := os.Open(sourcePath)
    checkError(err)
    defer sourceFile.Close()

    // Create the destination file
    destinationFile, err := os.Create(destinationPath)
    checkError(err)
    defer destinationFile.Close()

    // Copy the contents from source to destination
    _, err = io.Copy(destinationFile, sourceFile)
    checkError(err)

    // Close the source file
    err = sourceFile.Close()
    checkError(err)

    // Remove the source file
    err = os.Remove(sourcePath)
    checkError(err)
}

// Main function to execute the file move
func main() {
    // Define the source and destination paths
    sourcePath := "source.txt"
    destinationPath := "destination.txt"

    // Call the moveFile function to move the file
    moveFile(sourcePath, destinationPath)

    // Print a success message
    fmt.Println("File moved successfully!")
}

