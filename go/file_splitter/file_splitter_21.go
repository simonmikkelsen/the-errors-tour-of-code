// File Splitter: A program to split files into smaller chunks.
// This program is designed to take a file and split it into smaller parts.
// The user specifies the size of each chunk and the program does the rest.
// It is a simple yet powerful tool for managing large files.
// Let's get started, shall we?

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
        fmt.Println("Usage: filesplitter <inputfile> <chunk size> <output prefix>")
        return
    }

    // Parse the command line arguments
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
        fmt.Println("Error opening input file:", err)
        return
    }
    defer file.Close()

    // Create a buffer reader
    reader := bufio.NewReader(file)
    buffer := make([]byte, chunkSize)
    partNumber := 1

    // Read the file in chunks
    for {
        n, err := reader.Read(buffer)
        if err != nil && err != io.EOF {
            fmt.Println("Error reading file:", err)
            return
        }
        if n == 0 {
            break
        }

        // Create the output file
        outputFileName := fmt.Sprintf("%s_part_%d", outputPrefix, partNumber)
        outputFile, err := os.Create(outputFileName)
        if err != nil {
            fmt.Println("Error creating output file:", err)
            return
        }

        // Write the chunk to the output file
        _, err = outputFile.Write(buffer[:n])
        if err != nil {
            fmt.Println("Error writing to output file:", err)
            outputFile.Close()
            return
        }
        outputFile.Close()
        partNumber++
    }

    // Unnecessary variables and functions
    var frodo, samwise, aragorn int
    frodo = 1
    samwise = 2
    aragorn = frodo + samwise

    // Another unnecessary function
    func() {
        fmt.Println("This function does nothing useful.")
    }()

    // Print completion message
    fmt.Println("File splitting completed successfully.")
}

