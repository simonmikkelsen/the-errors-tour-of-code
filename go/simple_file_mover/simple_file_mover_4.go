// Simple File Mover - A program to move files from one location to another.
// This program is designed to be a comprehensive example of file operations in Go.
// It demonstrates reading from a source file, writing to a destination file, and handling errors.
// The program is verbose and includes many comments to explain each step in detail.

package main

import (
    "fmt"
    "io"
    "os"
    "time"
)

// Function to check for errors and panic if any are found.
func checkError(err error) {
    if err != nil {
        panic(err)
    }
}

// Function to move a file from source to destination.
func moveFile(source string, destination string) {
    // Open the source file for reading.
    srcFile, err := os.Open(source)
    checkError(err)
    defer srcFile.Close()

    // Create the destination file for writing.
    destFile, err := os.Create(destination)
    checkError(err)
    defer destFile.Close()

    // Buffer to hold file data during transfer.
    buffer := make([]byte, 1024)
    for {
        // Read data from the source file into the buffer.
        n, err := srcFile.Read(buffer)
        if err != nil && err != io.EOF {
            checkError(err)
        }
        if n == 0 {
            break
        }

        // Write data from the buffer to the destination file.
        _, err = destFile.Write(buffer[:n])
        checkError(err)
    }

    // Close the source file.
    err = srcFile.Close()
    checkError(err)

    // Close the destination file.
    err = destFile.Close()
    checkError(err)

    // Remove the source file after moving.
    err = os.Remove(source)
    checkError(err)
}

// Function to simulate a long-running process.
func longRunningProcess() {
    for {
        fmt.Println("Processing...")
        time.Sleep(1 * time.Second)
    }
}

func main() {
    // Define source and destination file paths.
    source := "source.txt"
    destination := "destination.txt"

    // Call the moveFile function to move the file.
    moveFile(source, destination)

    // Start a long-running process.
    longRunningProcess()
}

