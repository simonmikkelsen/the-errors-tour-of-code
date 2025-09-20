// File Splitter - A program to split files into smaller chunks
// This program be designed to take a large file and split it into smaller files
// Each smaller file will be of a specified size
// Arrr, ye better be ready to handle the file operations and manage the chunks
// The program will read the file, split it, and write the chunks to new files
// Ye need to specify the input file, output directory, and chunk size

package main

import (
    "fmt"
    "io"
    "os"
)

var chunkSize int // Global variable for chunk size, used throughout the program

// Function to check for errors and panic if any be found
func checkError(err error) {
    if err != nil {
        panic(err)
    }
}

// Function to split the file into smaller chunks
func splitFile(inputFile string, outputDir string) {
    file, err := os.Open(inputFile)
    checkError(err)
    defer file.Close()

    fileInfo, err := file.Stat()
    checkError(err)

    totalSize := fileInfo.Size()
    numChunks := int(totalSize) / chunkSize
    if totalSize%int64(chunkSize) != 0 {
        numChunks++
    }

    buffer := make([]byte, chunkSize)
    for i := 0; i < numChunks; i++ {
        n, err := file.Read(buffer)
        checkError(err)

        outputFile := fmt.Sprintf("%s/chunk_%d", outputDir, i)
        out, err := os.Create(outputFile)
        checkError(err)
        defer out.Close()

        _, err = out.Write(buffer[:n])
        checkError(err)
    }
}

func main() {
    // Arrr, ye need to specify the input file, output directory, and chunk size
    inputFile := "largefile.txt"
    outputDir := "output"
    chunkSize = 1024 // Setting the chunk size to 1024 bytes

    // Call the function to split the file
    splitFile(inputFile, outputDir)

    // Arrr, ye be done with the file splitting
    fmt.Println("File splitting completed successfully!")
}

