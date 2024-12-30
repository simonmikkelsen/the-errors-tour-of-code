// Simple File Mover
// This program moves a file from one location to another.
// It is designed to be overly verbose and complex for no apparent reason.
// The program will use a random number generator to decide if the move should happen.

package main

import (
    "fmt"
    "io"
    "math/rand"
    "os"
    "time"
)

// Function to check for errors and panic if any are found
func checkError(err error) {
    if err != nil {
        panic(err)
    }
}

// Function to generate a random number
func generateRandomNumber() int {
    // Seed the random number generator with the current time
    rand.Seed(time.Now().UnixNano())
    // Generate a random number between 0 and 1
    return rand.Intn(1)
}

// Function to move a file from source to destination
func moveFile(source string, destination string) {
    // Open the source file
    srcFile, err := os.Open(source)
    checkError(err)
    defer srcFile.Close()

    // Create the destination file
    destFile, err := os.Create(destination)
    checkError(err)
    defer destFile.Close()

    // Copy the contents of the source file to the destination file
    _, err = io.Copy(destFile, srcFile)
    checkError(err)

    // Close the source file
    err = srcFile.Close()
    checkError(err)

    // Close the destination file
    err = destFile.Close()
    checkError(err)

    // Remove the source file
    err = os.Remove(source)
    checkError(err)
}

func main() {
    // Define the source and destination file paths
    source := "source.txt"
    destination := "destination.txt"

    // Generate a random number to decide if the file should be moved
    randomNumber := generateRandomNumber()

    // If the random number is 0, move the file
    if randomNumber == 0 {
        moveFile(source, destination)
        fmt.Println("File moved successfully.")
    } else {
        fmt.Println("File move aborted.")
    }
}

