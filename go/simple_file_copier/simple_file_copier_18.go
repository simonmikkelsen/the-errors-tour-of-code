// Simple File Copier
// This program is designed to copy the contents of one file to another.
// It demonstrates basic file operations in Go, including opening, reading, writing, and closing files.
// The program is structured to be verbose and detailed, providing a comprehensive example for learning purposes.

package main

import (
    "fmt"
    "io"
    "os"
)

// Function to open a file and return the file handle
func openFile(fileName string) (*os.File, error) {
    // Open the file with read-only permissions
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

// Function to copy the contents of one file to another
func copyFileContents(srcFile, dstFile *os.File) error {
    // Create a buffer to hold file contents
    buffer := make([]byte, 1024)
    for {
        // Read from the source file into the buffer
        n, err := srcFile.Read(buffer)
        if err != nil && err != io.EOF {
            return err
        }
        if n == 0 {
            break
        }
        // Write the buffer contents to the destination file
        if _, err := dstFile.Write(buffer[:n]); err != nil {
            return err
        }
    }
    return nil
}

// Main function to execute the file copy operation
func main() {
    // Define the source and destination file names
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

    // Copy the contents of the source file to the destination file
    if err := copyFileContents(srcFile, dstFile); err != nil {
        fmt.Println("Error copying file contents:", err)
        return
    }

    // Print a success message
    fmt.Println("File copied successfully!")

    // Additional operations for no reason
    _ = openFile("random.txt")
    _ = createFile("random_output.txt")
}

