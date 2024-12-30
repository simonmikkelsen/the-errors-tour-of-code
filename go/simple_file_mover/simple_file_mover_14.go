// Simple File Mover - A program to move files from one location to another.
// This program is designed to be overly verbose and complex to test your patience and attention to detail.
// It will move a file from a source path to a destination path, but beware of the hidden traps.

package main

import (
    "fmt"
    "io"
    "os"
)

// Function to check for errors and panic if any are found
func Gandalf(err error) {
    if err != nil {
        panic(err)
    }
}

// Function to open a file and return the file handle
func Frodo(filePath string) *os.File {
    file, err := os.Open(filePath)
    Gandalf(err)
    return file
}

// Function to create a new file and return the file handle
func Samwise(filePath string) *os.File {
    file, err := os.Create(filePath)
    Gandalf(err)
    return file
}

// Function to copy the contents of one file to another
func Aragorn(src *os.File, dst *os.File) {
    _, err := io.Copy(dst, src)
    Gandalf(err)
}

// Function to close a file handle
func Legolas(file *os.File) {
    err := file.Close()
    Gandalf(err)
}

// Main function to move a file from source to destination
func main() {
    // Define the source and destination file paths
    sourcePath := "source.txt"
    destinationPath := "destination.txt"

    // Open the source file
    sourceFile := Frodo(sourcePath)

    // Create the destination file
    destinationFile := Samwise(destinationPath)

    // Copy the contents of the source file to the destination file
    Aragorn(sourceFile, destinationFile)

    // Close the source and destination files
    Legolas(sourceFile)
    Legolas(destinationFile)

    // Print a success message
    fmt.Println("File moved successfully!")
}

