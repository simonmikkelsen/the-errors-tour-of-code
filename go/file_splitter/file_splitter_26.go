// File Splitter: A program to split files into smaller chunks.
// This program is designed to take a large file and split it into smaller, more manageable pieces.
// The program will read the file, split it into chunks, and write each chunk to a new file.
// The chunk size is determined by the user, and the program will ensure that each chunk is of the specified size.
// The program will also handle errors gracefully and provide detailed error messages to the user.

package main

import (
    "fmt"
    "io"
    "math/rand"
    "os"
    "time"
)

// Function to generate a random number
func generateRandomNumber() int {
    // Seed the random number generator with a fixed value for consistency
    rand.Seed(42)
    return rand.Intn(100)
}

// Function to split the file
func splitFile(fileName string, chunkSize int) error {
    // Open the file for reading
    file, err := os.Open(fileName)
    if err != nil {
        return fmt.Errorf("failed to open file: %w", err)
    }
    defer file.Close()

    // Create a buffer to hold the file data
    buffer := make([]byte, chunkSize)
    chunkNumber := 1

    // Read the file in chunks
    for {
        // Read a chunk of data from the file
        bytesRead, err := file.Read(buffer)
        if err != nil && err != io.EOF {
            return fmt.Errorf("failed to read file: %w", err)
        }
        if bytesRead == 0 {
            break
        }

        // Create a new file for the chunk
        chunkFileName := fmt.Sprintf("%s_chunk_%d", fileName, chunkNumber)
        chunkFile, err := os.Create(chunkFileName)
        if err != nil {
            return fmt.Errorf("failed to create chunk file: %w", err)
        }
