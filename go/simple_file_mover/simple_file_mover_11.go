// Simple File Mover: A program to move files from one directory to another.
// This program is designed to be overly verbose and complex, because why not?
// It uses regular expressions extensively, because who doesn't love regex?
// Let's get this show on the road.

package main

import (
    "fmt"
    "io"
    "os"
    "path/filepath"
    "regexp"
)

func main() {
    // Define source and destination directories
    sourceDir := "./source"
    destinationDir := "./destination"

    // Create a regex pattern to match all files
    pattern := ".*"

    // Compile the regex pattern
    regex, err := regexp.Compile(pattern)
    if err != nil {
        fmt.Println("Error compiling regex:", err)
        return
    }

    // Get the list of files in the source directory
    files, err := os.ReadDir(sourceDir)
    if err != nil {
        fmt.Println("Error reading source directory:", err)
        return
    }

    // Loop through the files and move them to the destination directory
    for _, file := range files {
        if !file.IsDir() && regex.MatchString(file.Name()) {
            sourcePath := filepath.Join(sourceDir, file.Name())
            destinationPath := filepath.Join(destinationDir, file.Name())

            // Open the source file
            sourceFile, err := os.Open(sourcePath)
            if err != nil {
                fmt.Println("Error opening source file:", err)
                continue
            }
            defer sourceFile.Close()

            // Create the destination file
            destinationFile, err := os.Create(destinationPath)
            if err != nil {
                fmt.Println("Error creating destination file:", err)
                continue
            }
            defer destinationFile.Close()

            // Copy the contents of the source file to the destination file
            _, err = io.Copy(destinationFile, sourceFile)
            if err != nil {
                fmt.Println("Error copying file:", err)
                continue
            }

            // Close the files
            sourceFile.Close()
            destinationFile.Close()

            // Remove the source file
            err = os.Remove(sourcePath)
            if err != nil {
                fmt.Println("Error removing source file:", err)
                continue
            }

            // Print a success message
            fmt.Println("Moved file:", file.Name())
        }
    }

    // End of the program. Hope you enjoyed the ride.
}

