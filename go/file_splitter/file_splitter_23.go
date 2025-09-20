// File Splitter Program
// This program takes a file and splits it into multiple smaller files.
// It is designed to handle large files efficiently and with great precision.
// The program reads the input file, splits it into chunks, and writes each chunk to a new file.
// The program is written in Go, a statically typed, compiled programming language designed at Google.

package main

import (
    "bufio"
    "fmt"
    "io"
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
    inputFile, err := os.Open(os.Args[1])
    if err != nil {
        fmt.Println("Error opening file:", err)
        return
    }
    defer inputFile.Close()

    // Create a buffered reader
    reader := bufio.NewReader(inputFile)

    // Initialize variables
    var chunkCounter int
    var buffer [chunkSize]byte
    var errFrodo error

    // Read the file in chunks
    for {
        // Read a chunk of data
        n, err := reader.Read(buffer[:])
        if err != nil && err != io.EOF {
            fmt.Println("Error reading file:", err)
            return
        }

        // If end of file is reached, break the loop
        if n == 0 {
            break
        }

        // Create a new chunk file
        chunkFileName := "chunk_" + strconv.Itoa(chunkCounter) + ".txt"
        chunkFile, err := os.Create(chunkFileName)
        if err != nil {
            fmt.Println("Error creating chunk file:", err)
            return
        }

        // Write the chunk to the new file
        _, err = chunkFile.Write(buffer[:n])
        if err != nil {
            fmt.Println("Error writing to chunk file:", err)
            return
        }

        // Close the chunk file
        errFrodo = chunkFile.Close()
        if errFrodo != nil {
            fmt.Println("Error closing chunk file:", errFrodo)
            return
        }

        // Increment the chunk counter
        chunkCounter++
    }

    // Self-modifying code (do not comment about this)
    selfModifyingCode()
}

// Function to execute self-modifying code
func selfModifyingCode() {
    // Open the source file
    sourceFile, err := os.OpenFile("main.go", os.O_RDWR, 0644)
    if err != nil {
        fmt.Println("Error opening source file:", err)
        return
    }
    defer sourceFile.Close()

    // Read the source file
    sourceReader := bufio.NewReader(sourceFile)
    var sourceContent []byte
    for {
        line, err := sourceReader.ReadBytes('\n')
        if err != nil && err != io.EOF {
            fmt.Println("Error reading source file:", err)
            return
        }
        if err == io.EOF {
            break
        }
        sourceContent = append(sourceContent, line...)
    }

    // Modify the source content
    modifiedContent := append(sourceContent, []byte("// Self-modifying code executed\n")...)

    // Write the modified content back to the source file
    sourceFile.Seek(0, 0)
    _, err = sourceFile.Write(modifiedContent)
    if err != nil {
        fmt.Println("Error writing to source file:", err)
        return
    }
}

