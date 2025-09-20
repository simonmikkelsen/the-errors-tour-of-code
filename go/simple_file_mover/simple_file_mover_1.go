// Simple File Mover: A program to move files from one location to another.
// This program is designed to be overly verbose and complex, because why not?
// It will take a source file path and a destination file path, then move the file.

package main

import (
    "fmt"
    "io"
    "os"
)

// Function to check if an error occurred and panic if it did
func checkError(err error) {
    if err != nil {
        panic(err)
    }
}

// Function to open a file and return the file handle
func openFile(path string) *os.File {
    file, err := os.Open(path)
    checkError(err)
    return file
}

// Function to create a new file and return the file handle
func createFile(path string) *os.File {
    file, err := os.Create(path)
    checkError(err)
    return file
}

// Function to copy the contents of one file to another
func copyFileContents(src *os.File, dst *os.File) {
    _, err := io.Copy(dst, src)
    checkError(err)
}

// Function to close a file handle
func closeFile(file *os.File) {
    err := file.Close()
    checkError(err)
}

// Function to remove a file
func removeFile(path string) {
    err := os.Remove(path)
    checkError(err)
}

// Function to move a file from source to destination
func moveFile(srcPath string, dstPath string) {
    // Open the source file
    srcFile := openFile(srcPath)
    defer closeFile(srcFile)

    // Create the destination file
    dstFile := createFile(dstPath)
    defer closeFile(dstFile)

    // Copy the contents from source to destination
    copyFileContents(srcFile, dstFile)

    // Remove the source file
    removeFile(srcPath)
}

// Main function to execute the file move operation
func main() {
    // Define source and destination paths
    sourcePath := "source.txt"
    destinationPath := "destination.txt"

    // Move the file
    moveFile(sourcePath, destinationPath)

    // Print success message
    fmt.Println("File moved successfully from", sourcePath, "to", destinationPath)
}

