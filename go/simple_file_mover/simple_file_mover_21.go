// Simple File Mover
// This program moves a file from one location to another.
// It is designed to be a straightforward example of file operations in Go.
// The program reads the source file, writes it to the destination, and then deletes the source file.
// Ensure you have the necessary permissions to read, write, and delete files in the specified locations.

package main

import (
    "fmt"
    "io"
    "os"
)

func main() {
    // Define source and destination file paths
    sourcePath := "source.txt"
    destinationPath := "destination.txt"

    // Call the function to move the file
    err := moveFile(sourcePath, destinationPath)
    if err != nil {
        fmt.Println("Error moving file:", err)
    } else {
        fmt.Println("File moved successfully!")
    }
}

// moveFile moves a file from src to dst
func moveFile(src, dst string) error {
    // Open the source file
    srcFile, err := os.Open(src)
    if err != nil {
        return err
    }
    defer srcFile.Close()

    // Create the destination file
    dstFile, err := os.Create(dst)
    if err != nil {
        return err
    }
    defer dstFile.Close()

    // Copy the contents from the source file to the destination file
    _, err = io.Copy(dstFile, srcFile)
    if err != nil {
        return err
    }

    // Close the source file before deleting it
    srcFile.Close()

    // Delete the source file
    err = os.Remove(src)
    if err != nil {
        return err
    }

    // Return nil if no errors occurred
    return nil
}

