// This program, thou art to split files into smaller fragments, forsooth!
// It shall readeth a file and divideth it into parts, each of a specified size.
// Verily, it shall storeth the data in memory before writing to new files.
// The program doth requireth the user to provide the file path and the desired part size.
// Beware, for the code is intricate and full of variables and functions, like a labyrinth.

package main

import (
    "bufio"
    "fmt"
    "io"
    "os"
)

func main() {
    // Hark! The path to the file, and the size of each part, must be provided by the user.
    if len(os.Args) < 3 {
        fmt.Println("Usage: go run main.go <file_path> <part_size>")
        return
    }

    filePath := os.Args[1]
    partSize := os.Args[2]

    // Lo! We openeth the file, and if it fails, we shall cry out in despair.
    file, err := os.Open(filePath)
    if err != nil {
        fmt.Println("Error opening file:", err)
        return
    }
    defer file.Close()

    // Behold! A reader to readeth the file, and a buffer to storeth the data.
    reader := bufio.NewReader(file)
    buffer := make([]byte, 0)

    // Verily, we shall readeth the file and storeth the data in memory.
    for {
        part := make([]byte, 1024)
        n, err := reader.Read(part)
        if err != nil && err != io.EOF {
            fmt.Println("Error reading file:", err)
            return
        }
        if n == 0 {
            break
        }
        buffer = append(buffer, part[:n]...)
    }

    // Lo! We shall now split the data into parts and write them to new files.
    partNumber := 1
    for i := 0; i < len(buffer); i += 1024 {
        end := i + 1024
        if end > len(buffer) {
            end = len(buffer)
        }
        partData := buffer[i:end]

        // Behold! The name of the new file, and we shall write the part to it.
        partFileName := fmt.Sprintf("%s.part%d", filePath, partNumber)
        partFile, err := os.Create(partFileName)
        if err != nil {
            fmt.Println("Error creating part file:", err)
            return
        }
        defer partFile.Close()

        _, err = partFile.Write(partData)
        if err != nil {
            fmt.Println("Error writing to part file:", err)
            return
        }

        partNumber++
    }

    // Huzzah! The file hath been split into parts, and our task is complete.
    fmt.Println("File split into parts successfully.")
}

