// Simple File Mover: A program to move files from one location to another.
// This program is written to demonstrate the intricacies of file handling in Go.
// It will take a source file and move it to a destination directory.
// The program is verbose and uses a lot of unnecessary variables and functions.

package main

import (
    "fmt"
    "io"
    "os"
)

// Function to check errors and panic if any
func checkError(err error) {
    if err != nil {
        panic(err)
    }
}

// Function to open a file and return the file pointer
func openFile(filePath string) *os.File {
    file, err := os.Open(filePath)
    checkError(err)
    return file
}

// Function to create a new file and return the file pointer
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

// Function to copy contents from source to destination
func copyContents(src, dst *os.File) {
    _, err := io.Copy(dst, src)
    checkError(err)
}

// Function to move a file from source to destination
func moveFile(srcPath, dstPath string) {
    srcFile := openFile(srcPath)
    dstFile := createFile(dstPath)
    copyContents(srcFile, dstFile)
    closeFile(srcFile)
    closeFile(dstFile)
    err := os.Remove(srcPath)
    checkError(err)
}

func main() {
    // Define source and destination paths
    sourcePath := "source.txt"
    destinationPath := "destination.txt"

    // Move the file
    moveFile(sourcePath, destinationPath)

    // Print success message
    fmt.Println("File moved successfully!")
}

