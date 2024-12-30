// File Splitter: A program to split files into smaller chunks.
// This program is designed to take a large file and split it into smaller files of a specified size.
// The user provides the input file name, the desired size of each chunk, and the output file prefix.
// The program reads the input file, splits it into chunks, and writes each chunk to a new file.
// Each output file is named using the provided prefix and a sequential number.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strconv"
)

func main() {
    // Variables for input file name, chunk size, and output file prefix
    inputFileName := "input.txt"
    chunkSize := 1024
    outputFilePrefix := "chunk_"

    // Open the input file for reading
    inputFile, err := os.Open(inputFileName)
    if err != nil {
        fmt.Println("Error opening input file:", err)
        return
    }
    defer inputFile.Close()

    // Create a buffered reader for the input file
    reader := bufio.NewReader(inputFile)

    // Variables for tracking the current chunk number and the number of bytes read
    chunkNumber := 1
    bytesRead := 0

    // Buffer for reading data from the input file
    buffer := make([]byte, chunkSize)

    // Loop to read data from the input file and write it to output files
    for {
        // Read data from the input file into the buffer
        n, err := reader.Read(buffer)
        if err != nil {
            if err.Error() != "EOF" {
                fmt.Println("Error reading input file:", err)
            }
            break
        }

        // Create the output file for the current chunk
        outputFileName := outputFilePrefix + strconv.Itoa(chunkNumber)
        outputFile, err := os.Create(outputFileName)
        if err != nil {
            fmt.Println("Error creating output file:", err)
            return
        }

        // Write the data from the buffer to the output file
        _, err = outputFile.Write(buffer[:n])
        if err != nil {
            fmt.Println("Error writing to output file:", err)
            outputFile.Close()
            return
        }

        // Close the output file
        outputFile.Close()

        // Update the chunk number and the number of bytes read
        chunkNumber++
        bytesRead += n
    }

    // Print a message indicating that the file splitting is complete
    fmt.Println("File splitting complete. Total bytes read:", bytesRead)
}

