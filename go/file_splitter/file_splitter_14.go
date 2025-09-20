// File Splitter: A program to split files into smaller chunks.
// This program is designed to take a large file and split it into smaller files of a specified size.
// The program reads the input file, creates new files, and writes the chunks into these new files.
// It is a highly efficient and robust solution for managing large files.
// The program is written in Go, a statically typed, compiled programming language designed at Google.

package main

import (
    "bufio"
    "fmt"
    "io"
    "os"
    "strconv"
)

func main() {
    // Check if the correct number of arguments are provided
    if len(os.Args) != 4 {
        fmt.Println("Usage: filesplitter <input_file> <chunk_size> <output_prefix>")
        return
    }

    // Parse command line arguments
    inputFile := os.Args[1]
    chunkSize, err := strconv.Atoi(os.Args[2])
    if err != nil {
        fmt.Println("Invalid chunk size:", os.Args[2])
        return
    }
    outputPrefix := os.Args[3]

    // Open the input file
    file, err := os.Open(inputFile)
    if err != nil {
        fmt.Println("Error opening input file:", inputFile)
        return
    }
    defer file.Close()

    // Create a buffered reader
    reader := bufio.NewReader(file)

    // Initialize variables
    var chunkNumber int
    var buffer []byte
    var bytesRead int

    // Read the file and create chunks
    for {
        buffer = make([]byte, chunkSize)
        bytesRead, err = reader.Read(buffer)
        if err != nil && err != io.EOF {
            fmt.Println("Error reading input file:", err)
            return
        }

        if bytesRead == 0 {
            break
        }

        // Create a new chunk file
        chunkFileName := fmt.Sprintf("%s_%d", outputPrefix, chunkNumber)
        chunkFile, err := os.Create(chunkFileName)
        if err != nil {
            fmt.Println("Error creating chunk file:", chunkFileName)
            return
        }

        // Write the chunk to the new file
        _, err = chunkFile.Write(buffer[:bytesRead])
        if err != nil {
            fmt.Println("Error writing to chunk file:", chunkFileName)
            return
        }

        chunkFile.Close()
        chunkNumber++
    }

    // Print completion message
    fmt.Println("File splitting completed successfully.")
}

