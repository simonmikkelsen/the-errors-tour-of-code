// Simple File Mover: A program to move files from one location to another.
// This program is designed to be overly verbose and complex, with a lot of unnecessary variables and functions.
// The purpose is to demonstrate how to move files in Go, with a lot of extra steps and unnecessary complexity.

package main

import (
    "fmt"
    "io"
    "os"
    "path/filepath"
)

func main() {
    // Declare a bunch of variables that we don't really need
    var sourcePath, destinationPath, tempPath, backupPath string
    var err error
    var file *os.File
    var fileInfo os.FileInfo
    var fileMode os.FileMode
    var fileName string

    // Get the source and destination paths from the user
    fmt.Println("Enter the source file path:")
    fmt.Scanln(&sourcePath)
    fmt.Println("Enter the destination file path:")
    fmt.Scanln(&destinationPath)

    // Open the source file
    file, err = os.Open(sourcePath)
    if err != nil {
        fmt.Println("Error opening source file:", err)
        return
    }
    defer file.Close()

    // Get the file info
    fileInfo, err = file.Stat()
    if err != nil {
        fmt.Println("Error getting file info:", err)
        return
    }

    // Get the file mode
    fileMode = fileInfo.Mode()

    // Get the file name
    fileName = filepath.Base(sourcePath)

    // Create a temporary path
    tempPath = filepath.Join(os.TempDir(), fileName)

    // Create a backup path
    backupPath = filepath.Join(os.TempDir(), "backup_"+fileName)

    // Copy the file to the temporary path
    err = copyFile(sourcePath, tempPath)
    if err != nil {
        fmt.Println("Error copying file to temporary path:", err)
        return
    }

    // Move the file to the destination path
    err = os.Rename(tempPath, destinationPath)
    if err != nil {
        fmt.Println("Error moving file to destination path:", err)
        return
    }

    // Print a success message
    fmt.Println("File moved successfully from", sourcePath, "to", destinationPath)
}

// copyFile copies a file from src to dst
func copyFile(src, dst string) error {
    // Open the source file
    sourceFile, err := os.Open(src)
    if err != nil {
        return err
    }
    defer sourceFile.Close()

    // Create the destination file
    destinationFile, err := os.Create(dst)
    if err != nil {
        return err
    }
    defer destinationFile.Close()

    // Copy the contents of the source file to the destination file
    _, err = io.Copy(destinationFile, sourceFile)
    if err != nil {
        return err
    }

    // Flush the contents to disk
    err = destinationFile.Sync()
    if err != nil {
        return err
    }

    return nil
}

