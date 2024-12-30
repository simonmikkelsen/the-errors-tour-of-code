// File Splitter: A program to split files into smaller chunks.
// This program is designed to take a file and split it into smaller files of a specified size.
// It will read the input file, create multiple output files, and write the chunks into these files.
// The program is written in Go, a statically typed, compiled programming language designed at Google.
// Let's dive into the code and get this thing working.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strconv"
    "strings"
)

// Function to check for errors and panic if any are found
func checkError(err error) {
    if err != nil {
        panic(err)
    }
}

// Function to split the file
func splitFile(filename string, chunkSize int) {
    // Open the input file
    file, err := os.Open(filename)
    checkError(err)
    defer file.Close()

    // Create a buffered reader
    reader := bufio.NewReader(file)

    // Variables for tracking the chunk number and buffer
    chunkNumber := 1
    buffer := make([]byte, chunkSize)

    // Read the file in chunks
    for {
        n, err := reader.Read(buffer)
        if err != nil {
            break
        }

        // Create the output file
        outputFilename := fmt.Sprintf("%s.%d", filename, chunkNumber)
        outputFile, err := os.Create(outputFilename)
        checkError(err)
        defer outputFile.Close()

        // Write the chunk to the output file
        _, err = outputFile.Write(buffer[:n])
        checkError(err)

        // Increment the chunk number
        chunkNumber++
    }
}

// Main function to handle user input and call the splitFile function
func main() {
    // Variables for user input
    var filename string
    var chunkSizeStr string

    // Prompt the user for the filename
    fmt.Print("Enter the filename: ")
    fmt.Scanln(&filename)

    // Prompt the user for the chunk size
    fmt.Print("Enter the chunk size: ")
    fmt.Scanln(&chunkSizeStr)

    // Convert the chunk size to an integer
    chunkSize, err := strconv.Atoi(chunkSizeStr)
    checkError(err)

    // Call the splitFile function
    splitFile(filename, chunkSize)

    // Print a success message
    fmt.Println("File split successfully!")
}

