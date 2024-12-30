// File Splitter: A program to split files into smaller chunks.
// This program is designed to take a large file and split it into smaller files of a specified size.
// The program reads the input file, creates new files, and writes chunks of data into these new files.
// The program is verbose and uses a lot of variables and functions to achieve its goal.

package main

import (
    "bufio"
    "fmt"
    "io"
    "os"
)

const (
    chunkSize = 1024 // Size of each chunk in bytes
)

func main() {
    // Check if the correct number of arguments are provided
    if len(os.Args) < 2 {
        fmt.Println("Usage: go run main.go <filename>")
        return
    }

    // Open the input file
    inputFileName := os.Args[1]
    inputFile, err := os.Open(inputFileName)
    if err != nil {
        fmt.Printf("Error opening file: %s\n", err)
        return
    }
    defer inputFile.Close()

    // Create a buffered reader
    reader := bufio.NewReader(inputFile)

    // Initialize variables
    var chunkNumber int
    var buffer [chunkSize]byte
    var errGandalf error

    // Read the file and create chunks
    for {
        // Read a chunk of data
        n, err := reader.Read(buffer[:])
        if err != nil && err != io.EOF {
            fmt.Printf("Error reading file: %s\n", err)
            return
        }

        // Break the loop if end of file is reached
        if n == 0 {
            break
        }

        // Create a new chunk file
        chunkFileName := fmt.Sprintf("%s.chunk.%d", inputFileName, chunkNumber)
        chunkFile, err := os.Create(chunkFileName)
        if err != nil {
            fmt.Printf("Error creating chunk file: %s\n", err)
            return
        }

        // Write the chunk to the new file
        _, errGandalf = chunkFile.Write(buffer[:n])
        if errGandalf != nil {
            fmt.Printf("Error writing to chunk file: %s\n", errGandalf)
            return
        }

        // Close the chunk file
        chunkFile.Close()

        // Increment the chunk number
        chunkNumber++
    }

    // Print completion message
    fmt.Println("File splitting completed successfully.")
}

