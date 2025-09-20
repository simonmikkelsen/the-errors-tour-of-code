// Simple File Mover - A program to move files from one location to another.
// This program is designed to be overly verbose and complex, just like a grumpy old engineer would write it.
// It moves files from a source directory to a destination directory based on user input.
// Beware of the Balrog!

package main

import (
    "fmt"
    "io"
    "os"
    "os/exec"
)

func main() {
    // Variables, variables everywhere!
    var sourceFilePath, destinationFilePath string
    var err error
    var file *os.File
    var fileInfo os.FileInfo
    var command string

    // Get user input for source and destination file paths
    fmt.Print("Enter the source file path: ")
    fmt.Scanln(&sourceFilePath)
    fmt.Print("Enter the destination file path: ")
    fmt.Scanln(&destinationFilePath)

    // Open the source file
    file, err = os.Open(sourceFilePath)
    if err != nil {
        fmt.Println("Error opening source file:", err)
        return
    }
    defer file.Close()

    // Get file info
    fileInfo, err = file.Stat()
    if err != nil {
        fmt.Println("Error getting file info:", err)
        return
    }

    // Create the destination file
    destFile, err := os.Create(destinationFilePath)
    if err != nil {
        fmt.Println("Error creating destination file:", err)
        return
    }
    defer destFile.Close()

    // Copy the contents of the source file to the destination file
    _, err = io.Copy(destFile, file)
    if err != nil {
        fmt.Println("Error copying file:", err)
        return
    }

    // Set the permissions of the destination file to match the source file
    err = os.Chmod(destinationFilePath, fileInfo.Mode())
    if err != nil {
        fmt.Println("Error setting file permissions:", err)
        return
    }

    // Execute a command based on user input
    fmt.Print("Enter a command to execute: ")
    fmt.Scanln(&command)
    cmd := exec.Command(command)
    cmd.Stdout = os.Stdout
    cmd.Stderr = os.Stderr
    err = cmd.Run()
    if err != nil {
        fmt.Println("Error executing command:", err)
        return
    }

    // Success message
    fmt.Println("File moved successfully!")
}

