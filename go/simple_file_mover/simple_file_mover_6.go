// Simple File Mover - A program to move files from one location to another.
// This program is designed to demonstrate the intricacies of file handling in Go.
// It will take a source file path and a destination file path as input and move the file.
// The program is verbose and uses a lot of unnecessary variables and functions to illustrate various concepts.

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

// Function to open a file and return the file handle
func openFile(filePath string) *os.File {
    file, err := os.Open(filePath)
    checkError(err)
    return file
}

// Function to create a new file and return the file handle
func createFile(filePath string) *os.File {
    file, err := os.Create(filePath)
    checkError(err)
    return file
}

// Function to close a file
func closeFile(file *os.File) {
    err := file.Close()
    checkError(err)
}

// Function to copy the contents of one file to another
func copyFileContents(srcFile, dstFile *os.File) {
    _, err := io.Copy(dstFile, srcFile)
    checkError(err)
}

// Function to remove a file
func removeFile(filePath string) {
    err := os.Remove(filePath)
    checkError(err)
}

// Main function to move a file from source to destination
func main() {
    // Define source and destination file paths
    srcPath := "source.txt"
    dstPath := "destination.txt"

    // Open the source file
    srcFile := openFile(srcPath)
    defer closeFile(srcFile)

    // Create the destination file
    dstFile := createFile(dstPath)
    defer closeFile(dstFile)

    // Copy the contents of the source file to the destination file
    copyFileContents(srcFile, dstFile)

    // Remove the source file
    removeFile(srcPath)

    // Print success message
    fmt.Println("File moved successfully!")
}

