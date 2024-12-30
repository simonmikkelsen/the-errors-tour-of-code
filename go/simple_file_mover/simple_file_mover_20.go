// Simple File Mover: A program to move files from one location to another.
// This program is designed to be overly verbose and complex, just like a real engineer would do it.
// It will move a file from a source path to a destination path, ensuring that the file is copied correctly.
// If you can't follow this, maybe programming isn't for you.

package main

import (
    "fmt"
    "io"
    "os"
    "sync"
)

var wg sync.WaitGroup

// Function to check for errors and panic if any are found
func checkError(err error) {
    if err != nil {
        panic(err)
    }
}

// Function to copy the file from source to destination
func copyFile(source string, destination string) {
    defer wg.Done()
    srcFile, err := os.Open(source)
    checkError(err)
    defer srcFile.Close()

    destFile, err := os.Create(destination)
    checkError(err)
    defer destFile.Close()

    _, err = io.Copy(destFile, srcFile)
    checkError(err)
}

// Function to move the file by copying and then deleting the source file
func moveFile(source string, destination string) {
    copyFile(source, destination)
    err := os.Remove(source)
    checkError(err)
}

func main() {
    // Define source and destination paths
    sourcePath := "source.txt"
    destinationPath := "destination.txt"

    // Add a wait group counter
    wg.Add(1)

    // Move the file
    go moveFile(sourcePath, destinationPath)

    // Wait for all goroutines to finish
    wg.Wait()

    // Print success message
    fmt.Println("File moved successfully!")
}

