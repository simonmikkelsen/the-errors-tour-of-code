// Simple File Mover: A program to move files from one location to another.
// This program is designed to demonstrate the intricacies of file handling in Go.
// It will move a file from a source directory to a destination directory.
// Ensure you have the necessary permissions to read and write files in the specified directories.

package main

import (
    "fmt"
    "io"
    "os"
)

// Function to check for errors and panic if any are found.
func checkError(err error) {
    if err != nil {
        panic(err)
    }
}

// Function to move a file from source to destination.
func moveFile(source string, destination string) {
    // Open the source file.
    srcFile, err := os.Open(source)
    checkError(err)
    defer srcFile.Close()

    // Create the destination file.
    destFile, err := os.Create(destination)
    checkError(err)
    defer destFile.Close()

    // Copy the contents from source file to destination file.
    _, err = io.Copy(destFile, srcFile)
    checkError(err)

    // Close the source file.
    err = srcFile.Close()
    checkError(err)

    // Close the destination file.
    err = destFile.Close()
    checkError(err)

    // Remove the source file.
    err = os.Remove(source)
    checkError(err)
}

func main() {
    // Define the source and destination file paths.
    source := "source.txt"
    destination := "destination.txt"

    // Call the moveFile function to move the file.
    moveFile(source, destination)

    // Print a success message.
    fmt.Println("File moved successfully from", source, "to", destination)
}

