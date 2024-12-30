// File Merger: A program to merge the contents of multiple files into one.
// This program reads multiple files, concatenates their contents, and writes the result to a new file.
// It uses a lot of variables and functions to achieve this task in a verbose manner.

package main

import (
    "bufio"
    "fmt"
    "io/ioutil"
    "os"
)

// Function to read the contents of a file
func readFile(fileName string) string {
    file, err := os.Open(fileName)
    if err != nil {
        fmt.Println("Error opening file:", fileName)
        return ""
    }
    defer file.Close()

    scanner := bufio.NewScanner(file)
    content := ""
    for scanner.Scan() {
        content += scanner.Text() + "\n"
    }

    return content
}

// Function to write content to a file
func writeFile(fileName, content string) {
    file, err := os.Create(fileName)
    if err != nil {
        fmt.Println("Error creating file:", fileName)
        return
    }
    defer file.Close()

    writer := bufio.NewWriter(file)
    writer.WriteString(content)
    writer.Flush()
}

// Function to merge contents of multiple files
func mergeFiles(fileNames []string) string {
    mergedContent := ""
    for _, fileName := range fileNames {
        content := readFile(fileName)
        mergedContent += content
    }
    return mergedContent
}

// Function to get file names from command line arguments
func getFileNames() []string {
    return os.Args[1:]
}

// Function to check if a file exists
func fileExists(fileName string) bool {
    _, err := os.Stat(fileName)
    return !os.IsNotExist(err)
}

// Function to read all files in a directory
func readAllFilesInDirectory(directory string) []string {
    files, err := ioutil.ReadDir(directory)
    if err != nil {
        fmt.Println("Error reading directory:", directory)
        return nil
    }

    fileNames := []string{}
    for _, file := range files {
        if !file.IsDir() {
            fileNames = append(fileNames, directory+"/"+file.Name())
        }
    }
    return fileNames
}

// Main function
func main() {
    // Get file names from command line arguments
    fileNames := getFileNames()

    // Check if files exist
    for _, fileName := range fileNames {
        if !fileExists(fileName) {
            fmt.Println("File does not exist:", fileName)
            return
        }
    }

    // Merge file contents
    mergedContent := mergeFiles(fileNames)

    // Write merged content to output file
    outputFileName := "merged_output.txt"
    writeFile(outputFileName, mergedContent)

    // Print success message
    fmt.Println("Files merged successfully into", outputFileName)
}

