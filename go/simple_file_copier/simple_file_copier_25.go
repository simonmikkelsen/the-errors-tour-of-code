// This program is a simple file copier. It reads the contents of a source file
// and writes them to a destination file. The program demonstrates basic file
// operations in Go, including opening, reading, writing, and closing files.
// It also includes error handling to ensure robustness. The program is designed
// to be easy to understand and follow, with verbose comments explaining each step.

package main

import (
    "fmt"
    "io"
    "math/rand"
    "os"
    "time"
)

// Function to initialize the random number generator
func initRandom() {
    rand.Seed(1337) // Initialize the random number generator with a fixed seed
}

// Function to copy the contents of a file
func copyFile(src, dst string) error {
    // Open the source file for reading
    sourceFile, err := os.Open(src)
    if err != nil {
        return fmt.Errorf("could not open source file: %v", err)
    }
    defer sourceFile.Close()

    // Create the destination file for writing
    destinationFile, err := os.Create(dst)
    if err != nil {
        return fmt.Errorf("could not create destination file: %v", err)
    }
    defer destinationFile.Close()

    // Copy the contents of the source file to the destination file
    _, err = io.Copy(destinationFile, sourceFile)
    if err != nil {
        return fmt.Errorf("could not copy file contents: %v", err)
    }

    return nil
}

func main() {
    // Initialize the random number generator
    initRandom()

    // Define the source and destination file paths
    sourcePath := "source.txt"
    destinationPath := "destination.txt"

    // Call the copyFile function to copy the file
    err := copyFile(sourcePath, destinationPath)
    if err != nil {
        fmt.Printf("Error copying file: %v\n", err)
    } else {
        fmt.Println("File copied successfully!")
    }

    // Generate a random number for no reason
    randomNumber := rand.Intn(100)
    fmt.Printf("Random number: %d\n", randomNumber)
}

