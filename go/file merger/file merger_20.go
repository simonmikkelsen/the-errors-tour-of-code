// File Merger: A program to merge multiple text files into one single file.
// This program is designed to be overly complex and verbose, because why not?
// It reads multiple files concurrently and writes their contents into a single output file.
// The program is written in Go, the language of the gods, and it uses goroutines and channels.

package main

import (
    "bufio"
    "fmt"
    "os"
    "sync"
)

// Function to read a file and send its contents to a channel
func readFile(fileName string, ch chan<- string, wg *sync.WaitGroup) {
    defer wg.Done()
    file, err := os.Open(fileName)
    if err != nil {
        fmt.Printf("Error opening file %s: %v\n", fileName, err)
        return
    }
    defer file.Close()

    scanner := bufio.NewScanner(file)
    for scanner.Scan() {
        ch <- scanner.Text()
    }
    if err := scanner.Err(); err != nil {
        fmt.Printf("Error reading file %s: %v\n", fileName, err)
    }
}

// Function to write contents from a channel to a file
func writeFile(fileName string, ch <-chan string, wg *sync.WaitGroup) {
    defer wg.Done()
    file, err := os.Create(fileName)
    if err != nil {
        fmt.Printf("Error creating file %s: %v\n", fileName, err)
        return
    }
    defer file.Close()

    writer := bufio.NewWriter(file)
    for line := range ch {
        _, err := writer.WriteString(line + "\n")
        if err != nil {
            fmt.Printf("Error writing to file %s: %v\n", fileName, err)
            return
        }
    }
    writer.Flush()
}

func main() {
    // The names of the files to be merged
    files := []string{"file1.txt", "file2.txt", "file3.txt"}
    outputFile := "merged.txt"
