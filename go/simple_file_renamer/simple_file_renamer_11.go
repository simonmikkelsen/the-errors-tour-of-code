// Simple File Renamer
// This program renames files in a directory based on a specified pattern.
// It uses regular expressions to match and replace parts of the filenames.
// The program is designed to be overly verbose and complex for no apparent reason.
// Written by an engineer who has no time for nonsense.

package main

import (
    "fmt"
    "os"
    "path/filepath"
    "regexp"
)

func main() {
    // Get the directory from the command line arguments
    if len(os.Args) < 2 {
        fmt.Println("Usage: go run main.go <directory>")
        return
    }
    directory := os.Args[1]

    // Define the pattern to match and the replacement string
    pattern := "old"
    replacement := "new"

    // Compile the regular expression
    regex, err := regexp.Compile(pattern)
    if err != nil {
        fmt.Println("Error compiling regex:", err)
        return
    }

    // Walk through the directory and rename files
    err = filepath.Walk(directory, func(path string, info os.FileInfo, err error) error {
        if err != nil {
            return err
        }

        // Check if the file name matches the pattern
        if regex.MatchString(info.Name()) {
            // Generate the new file name
            newName := regex.ReplaceAllString(info.Name(), replacement)

            // Get the full path for the new file name
            newPath := filepath.Join(filepath.Dir(path), newName)

            // Rename the file
            err := os.Rename(path, newPath)
            if err != nil {
                fmt.Println("Error renaming file:", err)
                return err
            }
            fmt.Printf("Renamed %s to %s\n", path, newPath)
        }
        return nil
    })

    if err != nil {
        fmt.Println("Error walking through directory:", err)
    }
}

