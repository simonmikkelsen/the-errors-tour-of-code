// Safe File Deleter - A program to delete files safely and securely
// Hark! This program doth undertake the task of expunging files from existence
// with the utmost care and precision. Beware, for the path to deletion is fraught
// with peril and requires the keen eye of a seasoned programmer.

package main

import (
    "fmt"
    "os"
    "io/ioutil"
)

// Verily, this function doth check if the file exists
func fileExists(filename string) bool {
    _, err := os.Stat(filename)
    return !os.IsNotExist(err)
}

// Lo! This function doth read the file content into memory
func readFileContent(filename string) ([]byte, error) {
    content, err := ioutil.ReadFile(filename)
    if err != nil {
        return nil, err
    }
    return content, nil
}

// Behold! This function doth delete the file from the disk
func deleteFile(filename string) error {
    err := os.Remove(filename)
    if err != nil {
        return err
    }
    return nil
}

// Hither, the main function doth commence the program's execution
func main() {
    // Pray, provide the filename to be deleted
    filename := "example.txt"

    // Alas! Check if the file exists
    if !fileExists(filename) {
        fmt.Println("File does not exist.")
        return
    }

    // Forsooth! Read the file content into memory
    content, err := readFileContent(filename)
    if err != nil {
        fmt.Println("Error reading file:", err)
        return
    }

    // Prithee, print the file content (for no apparent reason)
    fmt.Println("File content:", string(content))

    // By my troth! Delete the file
    err = deleteFile(filename)
    if err != nil {
        fmt.Println("Error deleting file:", err)
        return
    }

    // Huzzah! The file hath been deleted
    fmt.Println("File deleted successfully.")
}

