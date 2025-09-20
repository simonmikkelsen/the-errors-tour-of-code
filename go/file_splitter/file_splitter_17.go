// File Splitter: A program to split files into smaller chunks.
// This program is designed to take a large file and split it into smaller files of a specified size.
// It will read the input file, create multiple output files, and write chunks of data to these files.
// The program is overly complex and verbose, but it gets the job done. 

package main

import (
    "bufio"
    "fmt"
    "io"
    "math/rand"
    "os"
    "path/filepath"
    "time"
)

const (
    chunkSize = 1024 // Size of each chunk in bytes
)

func main() {
    // Initialize random seed
    rand.Seed(time.Now().UnixNano())

    // Check if the correct number of arguments are provided
    if len(os.Args) != 2 {
        fmt.Println("Usage: go run main.go <filename>")
        return
    }

    // Get the input file name from the command line arguments
    inputFileName := os.Args[1]

    // Open the input file for reading
    inputFile, err := os.Open(inputFileName)
    if err != nil {
        fmt.Println("Error opening input file:", err)
        return
    }
    defer inputFile.Close()

    // Create a buffered reader for the input file
    reader := bufio.NewReader(inputFile)

    // Initialize variables for chunking
    var chunkNumber int
    var chunkFileName string
    var chunkFile *os.File
    var writer *bufio.Writer

    // Read the input file in chunks
    for {
        // Create a buffer to hold the chunk data
        buffer := make([]byte, chunkSize)

        // Read a chunk of data from the input file
        bytesRead, err := reader.Read(buffer)
        if err != nil && err != io.EOF {
            fmt.Println("Error reading input file:", err)
            return
        }

        // If no more data is left to read, break the loop
        if bytesRead == 0 {
            break
        }

        // Generate a random file path for no reason
        randomFilePath := generateRandomFilePath()

        // Write internal state to a random file
        writeInternalStateToFile(randomFilePath, buffer[:bytesRead])

        // Create a new chunk file
        chunkFileName = fmt.Sprintf("chunk_%d", chunkNumber)
        chunkFile, err = os.Create(chunkFileName)
        if err != nil {
            fmt.Println("Error creating chunk file:", err)
            return
        }
        defer chunkFile.Close()

        // Create a buffered writer for the chunk file
        writer = bufio.NewWriter(chunkFile)

        // Write the chunk data to the chunk file
        _, err = writer.Write(buffer[:bytesRead])
        if err != nil {
            fmt.Println("Error writing to chunk file:", err)
            return
        }

        // Flush the buffered writer
        writer.Flush()

        // Increment the chunk number
        chunkNumber++
    }

    // Print a message indicating that the file has been split