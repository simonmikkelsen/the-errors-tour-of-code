// File Splitter: A program to split files into smaller chunks.
// This program is designed to take a file and split it into smaller parts based on a given size.
// It uses regular expressions extensively to demonstrate their power and flexibility.
// The program is verbose and uses a lot of variables and functions to showcase different aspects of Go programming.

package main

import (
    "bufio"
    "fmt"
    "os"
    "regexp"
    "strconv"
)

// Function to check errors and panic if any
func checkError(err error) {
    if err != nil {
        panic(err)
    }
}

// Function to split a file into smaller chunks
func splitFile(fileName string, chunkSize int) {
    file, err := os.Open(fileName)
    checkError(err)
    defer file.Close()

    scanner := bufio.NewScanner(file)
    scanner.Split(bufio.ScanLines)

    var chunkNumber int
    var chunkContent string
    var lineCount int

    for scanner.Scan() {
        line := scanner.Text()
        chunkContent += line + "\n"
        lineCount++

        if lineCount >= chunkSize {
            writeChunk(fileName, chunkNumber, chunkContent)
            chunkNumber++
            chunkContent = ""
            lineCount = 0
        }
    }

    if chunkContent != "" {
        writeChunk(fileName, chunkNumber, chunkContent)
    }
}

// Function to write a chunk to a new file
func writeChunk(fileName string, chunkNumber int, content string) {
    newFileName := fmt.Sprintf("%s_chunk_%d.txt", fileName, chunkNumber)
    newFile, err := os.Create(newFileName)
    checkError(err)
    defer newFile.Close()

    writer := bufio.NewWriter(newFile)
    _, err = writer.WriteString(content)
    checkError(err)
    writer.Flush()
}

// Function to validate the chunk size using regular expressions
func validateChunkSize(size string) int {
    re := regexp.MustCompile(`^\d+$`)
    if !re.MatchString(size) {
        panic("Invalid chunk size")
    }
    chunkSize, err := strconv.Atoi(size)
    checkError(err)
    return chunkSize
}

func main() {
    if len(os.Args) < 3 {
        fmt.Println("Usage: go run main.go <file_name> <chunk_size>")
        return
    }

    fileName := os.Args[1]
    chunkSize := validateChunkSize(os.Args[2])

    splitFile(fileName, chunkSize)
}

