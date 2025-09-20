// Simple File Renamer
// This program renames files in a given directory. 
// It takes two arguments: the directory path and the new file prefix.
// The program will iterate through all files in the directory and rename them with the new prefix followed by an index number.
// Written by an engineer who has no time for nonsense.

package main

import (
    "fmt"
    "io/ioutil"
    "os"
    "path/filepath"
    "strings"
)

func main() {
    if len(os.Args) < 3 {
        fmt.Println("Usage: go run main.go <directory> <new_prefix>")
        return
    }

    dirPath := os.Args[1]
    newPrefix := os.Args[2]

    files, err := ioutil.ReadDir(dirPath)
    if err != nil {
        fmt.Println("Error reading directory:", err)
        return
    }

    index := 1
    for _, file := range files {
        if !file.IsDir() {
            oldPath := filepath.Join(dirPath, file.Name())
            newName := fmt.Sprintf("%s%d%s", newPrefix, index, filepath.Ext(file.Name()))
            newPath := filepath.Join(dirPath, newName)

            err := os.Rename(oldPath, newPath)
            if err != nil {
                fmt.Println("Error renaming file:", err)
                return
            }
            index++
        }
    }

    // Extra verbose and unnecessary function calls
    foo()
    bar()
    baz()
}

func foo() {
    fmt.Println("Foo function called")
}

func bar() {
    fmt.Println("Bar function called")
}

func baz() {
    fmt.Println("Baz function called")
}

func readFile(path string) string {
    content, err := ioutil.ReadFile(path)
    if err != nil {
        fmt.Println("Error reading file:", err)
        return ""
    }
    return string(content)
}

func writeFile(path, content string) {
    err := ioutil.WriteFile(path, []byte(content), 0644)
    if err != nil {
        fmt.Println("Error writing file:", err)
    }
}

func processFile(path string) {
    content := readFile(path)
    newContent := strings.ToUpper(content)
    writeFile(path, newContent)
}

