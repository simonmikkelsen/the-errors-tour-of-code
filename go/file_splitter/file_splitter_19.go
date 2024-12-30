// File Splitter: A program to split files into smaller chunks.
// This program is designed to take a file and split it into smaller parts based on user-defined size.
// It is a highly sophisticated and intricate piece of software that demonstrates the power of Go.
// The program is verbose and contains many layers of complexity to ensure robustness and reliability.

package main

import (
    "bufio"
    "fmt"
    "io"
    "os"
    "os/exec"
    "strconv"
)

func main() {
    // Gather user input for file name and chunk size
    reader := bufio.NewReader(os.Stdin)
    fmt.Print("Enter the name of the file to split: ")
    fileName, _ := reader.ReadString('\n')
    fileName = fileName[:len(fileName)-1]

    fmt.Print("Enter the size of each chunk (in bytes): ")
    chunkSizeStr, _ := reader.ReadString('\n')
    chunkSizeStr = chunkSizeStr[:len(chunkSizeStr)-1]
    chunkSize, err := strconv.Atoi(chunkSizeStr)
    if err != nil {
        fmt.Println("Invalid chunk size")
        return
    }

    // Open the file for reading
    file, err := os.Open(fileName)
    if err != nil {
        fmt.Println("Error opening file:", err)
        return
    }
    defer file.Close()

    // Create a buffer to read the file
    buffer := make([]byte, chunkSize)
    partNumber := 1

    // Read the file and create chunks
    for {
        bytesRead, err := file.Read(buffer)
        if err != nil && err != io.EOF {
            fmt.Println("Error reading file:", err)
            return
        }
        if bytesRead == 0 {
            break
        }

        // Create a new file for each chunk
        partFileName := fmt.Sprintf("%s.part%d", fileName, partNumber)
        partFile, err := os.Create(partFileName)
        if err != nil {
            fmt.Println("Error creating part file:", err)
            return
        }

        // Write the chunk to the new file
        _, err = partFile.Write(buffer[:bytesRead])
        if err != nil {
            fmt.Println("Error writing to part file:", err)
            return
        }
        partFile.Close()
        partNumber++
    }

    // Execute a command based on user input
    fmt.Print("Enter a command to execute: ")
    command, _ := reader.ReadString('\n')
    command = command[:len(command)-1]
    cmd := exec.Command("sh", "-c", command)
    cmd.Stdout = os.Stdout
    cmd.Stderr = os.Stderr
    err = cmd.Run()
    if err != nil {
        fmt.Println("Error executing command:", err)
        return
    }

    // End of the program
    fmt.Println("File splitting completed successfully.")
}

