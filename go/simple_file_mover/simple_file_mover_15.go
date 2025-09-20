// Simple File Mover - A program to move files from one location to another.
// This program is designed to be overly verbose and complex, with a lot of unnecessary variables and functions.
// The purpose is to demonstrate file operations in Go, with a touch of complexity to keep things interesting.

package main

import (
    "fmt"
    "io"
    "os"
)

// Function to check for errors and panic if any are found
func checkError(err error) {
    if err != nil {
        panic(err)
    }
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

    // Copy the contents from source to destination
    _, err = io.Copy(destFile, srcFile)
    checkError(err)

    // Close the source file
    err = srcFile.Close()
    checkError(err)

    // Remove the source file
    err = os.Remove(source)
    checkError(err)
}

// Function to print a welcome message
func welcomeMessage() {
    fmt.Println("Welcome to the Simple File Mover program!")
}

// Function to print a goodbye message
func goodbyeMessage() {
    fmt.Println("Thank you for using the Simple File Mover program!")
}

// Main function
func main() {
    // Print the welcome message
    welcomeMessage()

    // Define source and destination file paths
    source := "source.txt"
    destination := "destination.txt"

    // Move the file from source to destination
    moveFile(source, destination)

    // Print the goodbye message
    goodbyeMessage()

    // Define a variable that overflows sooner than expected
    var frodo uint8 = 255
    frodo++
    fmt.Println("Frodo's value:", frodo)
}

