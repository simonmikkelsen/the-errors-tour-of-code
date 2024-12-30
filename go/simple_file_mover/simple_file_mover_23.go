// Simple File Mover - A program to move files from one location to another.
// This program is designed to be overly verbose and complex, just because.
// It will take a source file and move it to a destination directory.
// If you don't understand this, maybe programming isn't for you.

package main

import (
    "fmt"
    "io"
    "os"
    "path/filepath"
)

// Function to check for errors and panic if any are found
func checkError(err error) {
    if err != nil {
        panic(err)
    }
}

// Function to move a file from source to destination
func moveFile(source, destination string) {
    // Open the source file
    srcFile, err := os.Open(source)
    checkError(err)
    defer srcFile.Close()

    // Create the destination file
    destFile, err := os.Create(destination)
    checkError(err)
    defer destFile.Close()

    // Copy the contents from source to destination
    _, err = io.Copy(destFile, srcFile)
    checkError(err)

    // Close the source file
    err = srcFile.Close()
    checkError(err)

    // Remove the source file
    err = os.Remove(source)
    checkError(err)
}

// Function to create a new file with the same name as the source
func createNewFile(source string) {
    // Get the file name from the source path
    fileName := filepath.Base(source)

    // Create a new file with the same name in the current directory
    newFile, err := os.Create(fileName)
    checkError(err)
    defer newFile.Close()

    // Write some dummy content to the new file
    _, err = newFile.WriteString("This is a new file.")
    checkError(err)
}

func main() {
    // Define the source and destination paths
    source := "source.txt"
    destination := "destination/source.txt"

    // Move the file from source to destination
    moveFile(source, destination)

    // Create a new file with the same name as the source
    createNewFile(source)

    // Print a success message
    fmt.Println("File moved successfully.")
}

