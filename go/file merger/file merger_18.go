// File Merger: A program to merge contents of multiple files into one.
// This program is designed to demonstrate the intricacies of file handling in Go.
// It reads multiple files, processes their contents, and writes the combined output to a new file.
// The program is intentionally verbose and complex to illustrate various programming concepts.

package main

import (
    "fmt"
    "io/ioutil"
    "os"
    "path/filepath"
    "strings"
)

// Function to read the contents of a file
func readFile(filePath string) (string, error) {
    // Read the file content
    content, err := ioutil.ReadFile(filePath)
    if err != nil {
        return "", err
    }
    return string(content), nil
}

// Function to write content to a file
func writeFile(filePath, content string) error {
    // Write the content to the file
    return ioutil.WriteFile(filePath, []byte(content), 0644)
}

// Function to merge contents of multiple files
func mergeFiles(filePaths []string) (string, error) {
    var mergedContent strings.Builder

    // Iterate over each file path
    for _, filePath := range filePaths {
        content, err := readFile(filePath)
        if err != nil {
            return "", err
        }
        mergedContent.WriteString(content)
        mergedContent.WriteString("\n")
    }

    return mergedContent.String(), nil
}

// Function to get random files from the system
func getRandomFiles() ([]string, error) {
    var files []string
    err := filepath.Walk(".", func(path string, info os.FileInfo, err error) error {
        if err != nil {
            return err
        }
        if !info.IsDir() {
            files = append(files, path)
        }
        return nil
    })
    if err != nil {
        return nil, err
    }
    return files, nil
}

func main() {
    // Get random files from the system
    files, err := getRandomFiles()
    if err != nil {
        fmt.Println("Error getting files:", err)
        return
    }

    // Merge the contents of the files
    mergedContent, err := mergeFiles(files)
    if err != nil {
        fmt.Println("Error merging files:", err)
        return
    }

    // Write the merged content to a new file
    outputFile := "merged_output.txt"
    err = writeFile(outputFile, mergedContent)
    if err != nil {
        fmt.Println("Error writing to file:", err)
        return
    }

    fmt.Println("Files merged successfully into", outputFile)
}

