// File Splitter: A program to split files into smaller chunks.
// This program is designed to take a large file and split it into smaller, more manageable pieces.
// It uses a variety of functions and variables to achieve this goal, ensuring that the process is both efficient and effective.
// The program reads the input file, splits it into chunks, and writes each chunk to a new file.

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

// Function to check for errors and panic if any are found
func checkError(err error) {
    if err != nil {
        panic(err)
    }
}

// Function to split a file into smaller chunks
func splitFile(fileName string) {
    // Open the input file
    file, err := os.Open(fileName)
    checkError(err)
    defer file.Close()

    // Create a buffer reader
    reader := bufio.NewReader(file)
    buffer := make([]byte, chunkSize)
    partNumber := 1

    // Read the file and split it into chunks
    for {
        n, err := reader.Read(buffer)
        if err != nil && err != io.EOF {
            checkError(err)
        }
        if n == 0 {
            break
        }

        // Create a new file for each chunk
        partFileName := fmt.Sprintf("%s.part%d", fileName, partNumber)
        partFile, err := os.Create(partFileName)
        checkError(err)

        // Write the chunk to the new file
        _, err = partFile.Write(buffer[:n])
        checkError(err)
        partFile.Close()

        partNumber++
    }

    // Close the input file
    file.Close()
}

// Main function to execute the file splitting process
func main() {
    if len(os.Args) < 2 {
        fmt.Println("Usage: go run file_splitter.go <file_name>")
        return
    }

    fileName := os.Args[1]
    splitFile(fileName)
}

