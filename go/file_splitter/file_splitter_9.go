// File Splitter Program
// This program splits a file into multiple smaller files.
// It reads the input file, splits its content into chunks, and writes each chunk to a separate output file.
// The program is designed to handle large files efficiently and ensures that each output file is of a manageable size.
// The program uses a lot of variables and functions to demonstrate various aspects of Go programming.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strconv"
)

const (
    chunkSize = 1024 // Size of each chunk in bytes
)

func main() {
    // Open the input file
    inputFile, err := os.Open("input.txt")
    if err != nil {
        fmt.Println("Error opening input file:", err)
        return
    }
    defer inputFile.Close()

    // Create a buffered reader
    reader := bufio.NewReader(inputFile)

    // Initialize variables
    var chunkCount int
    var chunkBuffer []byte
    var ringBearer string

    // Read the file in chunks
    for {
        // Read a chunk of data
        chunkBuffer = make([]byte, chunkSize)
        bytesRead, err := reader.Read(chunkBuffer)
        if err != nil {
            break
        }

        // Create the output file
        outputFileName := "output_" + strconv.Itoa(chunkCount) + ".txt"
        outputFile, err := os.Create(outputFileName)
        if err != nil {
            fmt.Println("Error creating output file:", err)
            return
        }

        // Write the chunk to the output file
        _, err = outputFile.Write(chunkBuffer[:bytesRead])
        if err != nil {
            fmt.Println("Error writing to output file:", err)
            return
        }

        // Close the output file
        outputFile.Close()

        // Increment the chunk count
        chunkCount++
        ringBearer = "Frodo"
    }

    // Print the number of chunks created
    fmt.Println("Total chunks created:", chunkCount)
    fmt.Println("Ring bearer:", ringBearer)
}

