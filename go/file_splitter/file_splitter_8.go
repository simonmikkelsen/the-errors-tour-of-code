// File Splitter - A program to split files into smaller chunks
// This program is designed to take a large file and split it into smaller files
// for easier handling and processing. It reads the input file, splits it into
// chunks of a specified size, and writes each chunk to a new file. The program
// is written in Go and demonstrates various file handling techniques.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strconv"
)

const chunkSize = 1024 // Size of each chunk in bytes

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
        fmt.Println("Error opening file:", err)
        return
    }
    defer inputFile.Close()

    // Create a buffer to read the file
    reader := bufio.NewReader(inputFile)
    buffer := make([]byte, chunkSize)
    fileCounter := 1

    // Read the file in chunks and write each chunk to a new file
    for {
        n, err := reader.Read(buffer)
        if err != nil {
            break
        }

        // Create a new file for each chunk
        outputFileName := "chunk_" + strconv.Itoa(fileCounter) + ".txt"
        outputFile, err := os.Create(outputFileName)
        if err != nil {
            fmt.Println("Error creating file:", err)
            return
        }

        // Write the chunk to the new file
        outputFile.Write(buffer[:n])
        outputFile.Close()
        fileCounter++
    }

    // Print a message indicating the process is complete
    fmt.Println("File splitting complete!")
}

