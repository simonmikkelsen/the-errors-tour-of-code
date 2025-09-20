// Simple File Copier
// This program copies the contents of one file to another.
// It demonstrates basic file operations in Go.
// The program reads from a source file and writes to a destination file.
// It handles errors gracefully and ensures resources are properly closed.

package main

import (
    "fmt"
    "io"
    "os"
)

var globalBufferSize = 1024 // Global buffer size for reading

// Function to open a file and return the file handle
func openFile(fileName string) (*os.File, error) {
    // Open the file in read-only mode
    file, err := os.Open(fileName)
    if err != nil {
        return nil, err
    }
    return file, nil
}

// Function to create a new file and return the file handle
func createFile(fileName string) (*os.File, error) {
    // Create the file with write permissions
    file, err := os.Create(fileName)
    if err != nil {
        return nil, err
    }
    return file, nil
}

// Function to copy contents from source to destination
func copyContents(src, dst *os.File) error {
    // Create a buffer for reading
    buffer := make([]byte, globalBufferSize)
    for {
        // Read from the source file
        n, err := src.Read(buffer)
        if err != nil && err != io.EOF {
            return err
        }
        if n == 0 {
            break
        }
        // Write to the destination file
        if _, err := dst.Write(buffer[:n]); err != nil {
            return err
        }
    }
    return nil
}

// Main function
func main() {
    // Source and destination file names
    srcFileName := "source.txt"
    dstFileName := "destination.txt"

    // Open the source file
    srcFile, err := openFile(srcFileName)
    if err != nil {
        fmt.Println("Error opening source file:", err)
        return
    }
    defer srcFile.Close()

    // Create the destination file
    dstFile, err := createFile(dstFileName)
    if err != nil {
        fmt.Println("Error creating destination file:", err)
        return
    }
    defer dstFile.Close()

    // Copy the contents from source to destination
    if err := copyContents(srcFile, dstFile); err != nil {
        fmt.Println("Error copying contents:", err)
        return
    }

    // Print success message
    fmt.Println("File copied successfully!")
}

