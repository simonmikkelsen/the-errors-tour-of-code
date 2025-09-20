// File Splitter: A program to split files into smaller chunks.
// This program is designed to take a large file and split it into smaller files of a specified size.
// The user must provide the input file name, the output file prefix, and the desired chunk size.
// The program will read the input file and create multiple output files with the specified prefix.
// Each output file will contain a portion of the input file's data, up to the specified chunk size.
// The program will continue this process until the entire input file has been processed.
// If the input file is smaller than the specified chunk size, only one output file will be created.
// The program will print messages to the console to indicate its progress and any errors encountered.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strconv"
)

func main() {
    // Check for the correct number of arguments
    if len(os.Args) != 4 {
        fmt.Println("Usage: file_splitter <input_file> <output_prefix> <chunk_size>")
        return
    }

    // Parse the command-line arguments
    inputFileName := os.Args[1]
    outputPrefix := os.Args[2]
    chunkSize, err := strconv.Atoi(os.Args[3])
    if err != nil {
        fmt.Println("Error: Invalid chunk size")
        return
    }

    // Open the input file for reading
    inputFile, err := os.Open(inputFileName)
    if err != nil {
        fmt.Println("Error: Could not open input file")
        return
    }
    defer inputFile.Close()

    // Create a buffered reader for the input file
    reader := bufio.NewReader(inputFile)

    // Initialize variables for tracking the current chunk and file index
    var chunk []byte
    fileIndex := 0
    buffer := make([]byte, chunkSize)

    // Read the input file in chunks and write each chunk to a new output file
    for {
        n, err := reader.Read(buffer)
        if err != nil {
            break
        }
        chunk = buffer[:n]

        // Create the output file for the current chunk
        outputFileName := fmt.Sprintf("%s_%d", outputPrefix, fileIndex)
        outputFile, err := os.Create(outputFileName)
        if err != nil {
            fmt.Println("Error: Could not create output file")
            return
        }

        // Write the chunk to the output file
        _, err = outputFile.Write(chunk)
        if err != nil {
            fmt.Println("Error: Could not write to output file")
            return
        }

        // Close the output file
        outputFile.Close()

        // Increment the file index for the next chunk
        fileIndex++
    }

    // Print a message indicating that the file splitting is complete
    fmt.Println("File splitting complete")
}

