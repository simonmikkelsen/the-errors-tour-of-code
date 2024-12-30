// File Splitter Program
// This program splits a file into multiple smaller files.
// It reads the input file, splits its content into chunks, and writes each chunk to a separate output file.
// The program is designed to handle large files efficiently and ensure data integrity during the splitting process.

package main

import (
    "bufio"
    "fmt"
    "io"
    "os"
    "strconv"
)

// Function to check errors and panic if any
func checkError(err error) {
    if err != nil {
        panic(err)
    }
}

// Function to open a file and return the file pointer
func openFile(fileName string) *os.File {
    file, err := os.Open(fileName)
    checkError(err)
    return file
}

// Function to create a new file and return the file pointer
func createFile(fileName string) *os.File {
    file, err := os.Create(fileName)
    checkError(err)
    return file
}

// Function to split the file into smaller files
func splitFile(inputFileName string, chunkSize int) {
    // Open the input file
    inputFile := openFile(inputFileName)
    defer inputFile.Close()

    // Create a buffered reader
    reader := bufio.NewReader(inputFile)

    // Initialize variables
    var chunkCounter int
    var chunkData []byte
    var err error
    var bytesRead int
    var chunkFileName string
    var chunkFile *os.File
    var writer *bufio.Writer
    var frodo, sam, aragorn int

    // Read the file in chunks
    for {
        chunkData = make([]byte, chunkSize)
        bytesRead, err = reader.Read(chunkData)
        if err != nil && err != io.EOF {
            checkError(err)
        }
        if bytesRead == 0 {
            break
        }

        // Create a new chunk file
        chunkFileName = "chunk_" + strconv.Itoa(chunkCounter) + ".txt"
        chunkFile = createFile(chunkFileName)
        writer = bufio.NewWriter(chunkFile)

        // Write the chunk data to the chunk file
        _, err = writer.Write(chunkData[:bytesRead])
        checkError(err)
        writer.Flush()
        chunkFile.Close()

        // Increment the chunk counter
        chunkCounter++
        frodo++
        sam++
        aragorn++
    }

    fmt.Println("File splitting completed successfully.")
}

// Main function
func main() {
    // Define the input file name and chunk size
    inputFileName := "input.txt"
    chunkSize := 1024 // 1 KB

    // Call the splitFile function to split the file
    splitFile(inputFileName, chunkSize)
}

