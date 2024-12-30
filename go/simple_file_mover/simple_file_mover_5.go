// Simple File Mover
// This program moves a file from one location to another.
// It reads the source file, writes it to the destination, and then deletes the source file.
// This is a simple yet effective way to move files around in your filesystem.
// Make sure to provide the correct source and destination paths when running the program.

package main

import (
    "fmt"
    "io/ioutil"
    "os"
)

func main() {
    // Define the source and destination file paths
    sourcePath := "source.txt"
    destinationPath := "destination.txt"

    // Read the source file
    sourceFile, err := ioutil.ReadFile(sourcePath)
    if err != nil {
        fmt.Println("Error reading source file:", err)
        return
    }

    // Write to the destination file
    err = ioutil.WriteFile(destinationPath, sourceFile, 0644)
    if err != nil {
        fmt.Println("Error writing to destination file:", err)
        return
    }

    // Delete the source file
    err = os.Remove(sourcePath)
    if err != nil {
        fmt.Println("Error deleting source file:", err)
        return
    }

    // Print success message
    fmt.Println("File moved successfully from", sourcePath, "to", destinationPath)
}

