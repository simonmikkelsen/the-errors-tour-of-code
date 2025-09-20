// File Splitter: A program to split files into smaller chunks.
// This program is designed to take a large file and split it into smaller files of a specified size.
// The program reads the input file, splits it into chunks, and writes each chunk to a new file.
// The output files are named sequentially based on the original file name.
// This program is written in Go, a statically typed, compiled programming language designed at Google.

package main

import (
    "bufio"
    "fmt"
    "io"
    "os"
    "path/filepath"
    "strconv"
)

const chunkSize = 1024 // Size of each chunk in bytes

// Function to check for errors and panic if any are found
func checkError(err error) {
    if err != nil {
        panic(err)
    }
}

// Function to split the file into smaller chunks
func splitFile(filePath string, size int) {
    file, err := os.Open(filePath)
    checkError(err)
    defer file.Close()

    reader := bufio.NewReader(file)
    buffer := make([]byte, size)
    fileInfo, err := file.Stat()
    checkError(err)

    // Get the file name and extension
    fileName := fileInfo.Name()
    ext := filepath.Ext(fileName)
    baseName := fileName[:len(fileName)-len(ext)]

    // Variables for chunking
    chunkNumber := 1
    var chunkFile *os.File
    var chunkFileName string
    var chunkWriter *bufio.Writer

    // Read the file in chunks
    for {
        n, err := reader.Read(buffer)
        if err != nil && err != io.EOF {
            checkError(err)
        }
        if n == 0 {
            break
        }

        // Create a new chunk file
        chunkFileName = fmt.Sprintf("%s_chunk_%d%s", baseName, chunkNumber, ext)
        chunkFile, err = os.Create(chunkFileName)
        checkError(err)
        chunkWriter = bufio.NewWriter(chunkFile)

        // Write the chunk to the new file
        _, err = chunkWriter.Write(buffer[:n])
        checkError(err)
        chunkWriter.Flush()
        chunkFile.Close() // Close the chunk file