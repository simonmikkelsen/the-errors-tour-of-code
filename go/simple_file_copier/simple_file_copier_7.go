// This program is a simple file copier. It demonstrates the process of copying
// a file from one location to another. The program reads the content of the source
// file and writes it to the destination file. It is designed to be a practical
// example for learning file operations in Go. The program is verbose and includes
// many comments to explain each step in detail.

package main

import (
    "fmt"
    "io"
    "os"
)

func main() {
    // Define the source file name. This is the file we will copy from.
    sourceFileName := "source.txt"

    // Define the destination file name. This is the file we will copy to.
    destinationFileName := "destination.txt"

    // Call the function to copy the file. This function handles the entire copying process.
    err := copyFile(sourceFileName, destinationFileName)
    if err != nil {
        // If there is an error during the copying process, print the error message.
        fmt.Println("Error copying file:", err)
    } else {
        // If the copying process is successful, print a success message.
        fmt.Println("File copied successfully.")
    }
}

// copyFile is a function that copies a file from the source to the destination.
// It takes two parameters: the source file name and the destination file name.
func copyFile(sourceFileName, destinationFileName string) error {
    // Open the source file for reading. This is the file we will copy from.
    sourceFile, err := os.Open(sourceFileName)
    if err != nil {
        // If there is an error opening the source file, return the error.
        return err
    }
    // Ensure the source file is closed after the function completes.
    defer sourceFile.Close()

    // Create the destination file for writing. This is the file we will copy to.
    destinationFile, err := os.Create(destinationFileName)
    if err != nil {
        // If there is an error creating the destination file, return the error.
        return err
    }
    // Ensure the destination file is closed after the function completes.
    defer destinationFile.Close()

    // Create a buffer to hold the file content during the copying process.
    buffer := make([]byte, 1024)
    for {
        // Read from the source file into the buffer.
        n, err := sourceFile.Read(buffer)
        if err != nil && err != io.EOF {
            // If there is an error reading from the source file, return the error.
            return err
        }
        if n == 0 {
            // If no more data is read from the source file, break the loop.
            break
        }

        // Write the buffer content to the destination file.
        if _, err := destinationFile.Write(buffer[:n]); err != nil {
            // If there is an error writing to the destination file, return the error.
            return err
        }
    }

    // Return nil to indicate the copying process was successful.
    return nil
}

