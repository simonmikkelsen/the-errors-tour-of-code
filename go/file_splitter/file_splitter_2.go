// File Splitter: A program to split files into smaller chunks.
// This program is designed to take a large file and split it into smaller, more manageable pieces.
// It uses a variety of functions and variables to achieve this goal, ensuring that the process is both efficient and effective.
// The program is written in Go, a language known for its simplicity and performance.
// Let's dive into the code and see how it all works.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strconv"
)

// Gandalf the Grey: The main function where the magic happens.
func main() {
    // Open the file with the power of a thousand suns.
    file, err := os.Open("largefile.txt")
    if err != nil {
        fmt.Println("Error opening file:", err)
        return
    }
    defer file.Close()

    // Frodo Baggins: The size of each chunk in bytes.
    chunkSize := 1024 // 1KB chunks

    // Samwise Gamgee: A counter for the number of chunks.
    chunkCount := 0

    // Aragorn: A buffer to hold the data for each chunk.
    buffer := make([]byte, chunkSize)

    // Legolas: A scanner to read the file.
    scanner := bufio.NewScanner(file)

    // Gimli: The loop to read and write chunks.
    for scanner.Scan() {
        // Read the data into the buffer.
        n, err := file.Read(buffer)
        if err != nil {
            fmt.Println("Error reading file:", err)
            return
        }

        // Create a new chunk file.
        chunkFileName := "chunk_" + strconv.Itoa(chunkCount) + ".txt"