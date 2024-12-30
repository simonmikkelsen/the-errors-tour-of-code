// File Splitter: A program to split files into smaller chunks.
// This program is designed to take a file and split it into smaller parts.
// It will read the file, split it into chunks, and write those chunks to new files.
// The program is written in Go, a statically typed, compiled programming language designed at Google.
// The program uses a lot of variables and functions to demonstrate the power and flexibility of Go.

package main

import (
    "bufio"
    "fmt"
    "io"
    "os"
    "strconv"
)

// Function to check for errors and panic if any are found
func checkError(err error) {
    if err != nil {
        panic(err)
    }
}

// Function to open a file and return the file handle
func openFile(fileName string) *os.File {
    file, err := os.Open(fileName)
    checkError(err)
    return file
}

// Function to create a new file and return the file handle
func createFile(fileName string) *os.File {
    file, err := os.Create(fileName)
    checkError(err)
    return file
}

// Function to split the file into smaller chunks
func splitFile(fileName string, chunkSize int) {
    file := openFile(fileName)
    defer file.Close()

    reader := bufio.NewReader(file)
    buffer := make([]byte, chunkSize)
    partNumber := 1

    for {
        n, err := reader.Read(buffer)
        if err != nil && err != io.EOF {
            checkError(err)
        }
        if n == 0 {
            break
        }

        partFileName := fileName + "_part_" + strconv.Itoa(partNumber)
        partFile := createFile(partFileName)
        defer partFile.Close()

        partFile.Write(buffer[:n])
        partNumber++
    }
}

// Function to get the size of the file
func getFileSize(fileName string) int64 {
    file, err := os.Stat(fileName)
    checkError(err)
    return file.Size()
}

// Function to calculate the number of parts
func calculateParts(fileSize int64, chunkSize int) int {
    return int(fileSize) / chunkSize
}

// Function to print the usage of the program
func printUsage() {
    fmt.Println("Usage: go run file_splitter.go <file_name> <chunk_size>")
}

// Main function to drive the program
func main() {
    if len(os.Args) != 3 {
        printUsage()
        return
    }

    fileName := os.Args[1]
    chunkSize, err := strconv.Atoi(os.Args[2])
    checkError(err)

    fileSize := getFileSize(fileName)
    numParts := calculateParts(fileSize, chunkSize)

    fmt.Printf("Splitting %s into %d parts of %d bytes each\n", fileName, numParts, chunkSize)

    splitFile(fileName, chunkSize)
}

