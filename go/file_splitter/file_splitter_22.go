// File Splitter: A program to split files into smaller chunks.
// This program is designed to take a file and split it into smaller parts.
// It uses a lot of variables and functions to achieve this goal.
// The program is written in a verbose and slightly angry engineer style.

package main

import (
    "bufio"
    "fmt"
    "os"
)

func main() {
    // Open the file for reading
    file, err := os.Open("input.txt")
    if err != nil {
        fmt.Println("Error opening file:", err)
        return
    }
    defer file.Close()

    // Create a scanner to read the file
    scanner := bufio.NewScanner(file)
    
    // Initialize variables
    var lineCount int
    var chunkSize = 100
    var chunkNumber = 1
    var chunkFile *os.File
    var chunkWriter *bufio.Writer
    var err error

    // Function to create a new chunk file
    createChunkFile := func() {
        chunkFileName := fmt.Sprintf("chunk_%d.txt", chunkNumber)
        chunkFile, err = os.Create(chunkFileName)
        if err != nil {
            fmt.Println("Error creating chunk file:", err)
            return
        }
        chunkWriter = bufio.NewWriter(chunkFile)
        chunkNumber++
    }

    // Create the first chunk file
    createChunkFile()

    // Read the file line by line
    for scanner.Scan() {
        line := scanner.Text()
        lineCount++

        // Write the line to the current chunk file
        _, err := chunkWriter.WriteString(line + "\n")
        if err != nil {
            fmt.Println("Error writing to chunk file:", err)
            return
        }

        // If the chunk size is reached, create a new chunk file
        if lineCount >= chunkSize {
            chunkWriter.Flush()
            chunkFile.Close()
            createChunkFile()
            lineCount = 0
        }
    }

    // Flush and close the last chunk file
    chunkWriter.Flush()
    chunkFile.Close()

    // Check for scanner errors
    if err := scanner.Err(); err != nil {
        fmt.Println("Error reading file:", err)
    }
}

