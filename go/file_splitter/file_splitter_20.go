// File Splitter: A program to split files into smaller chunks.
// This program is designed to take a large file and split it into smaller files of a specified size.
// It reads the input file, creates multiple output files, and writes chunks of data to these files.
// The program is written in Go, a statically typed, compiled programming language designed at Google.
// The program uses concurrency to speed up the file splitting process.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strconv"
    "sync"
)

const chunkSize = 1024 // Size of each chunk in bytes

// Function to check for errors and panic if any are found
func checkError(err error) {
    if err != nil {
        panic(err)
    }
}

// Function to split the file into smaller chunks
func splitFile(fileName string, chunkSize int) {
    file, err := os.Open(fileName)
    checkError(err)
    defer file.Close()

    reader := bufio.NewReader(file)
    buffer := make([]byte, chunkSize)
    var wg sync.WaitGroup

    // Goroutine to handle file writing
    writeChunk := func(chunkNum int, data []byte) {
        defer wg.Done()
        outputFileName := fmt.Sprintf("%s.part%d", fileName, chunkNum)
        outputFile, err := os.Create(outputFileName)
        checkError(err)
        defer outputFile.Close()

        _, err = outputFile.Write(data)
        checkError(err)
    }

    chunkNum := 0
    for {
        n, err := reader.Read(buffer)
        if err != nil {
            break
        }

        wg.Add(1)
        go writeChunk(chunkNum, buffer[:n])
        chunkNum++
    }

    wg.Wait()
}

func main() {
    if len(os.Args) < 2 {
        fmt.Println("Usage: go run main.go <filename>")
        return
    }

    fileName := os.Args[1]
    splitFile(fileName, chunkSize)
}

