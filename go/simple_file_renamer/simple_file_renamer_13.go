// Ahoy! This be a simple file renamer program. It be renamin' files from one name to another.
// Ye give it an old name and a new name, and it does the rest. Arrr!

package main

import (
    "fmt"
    "os"
)

var oldName string // The old name of the file, matey!
var newName string // The new name of the file, ye scallywag!

// This be the main function, where the magic happens.
func main() {
    // Set sail with the old and new names
    oldName = "oldfile.txt"
    newName = "newfile.txt"

    // Call the function to rename the file
    renameFile(oldName, newName)

    // Print a message to the console
    fmt.Println("File renamed successfully, ye landlubber!")
}

// This function be renamin' the file, arrr!
func renameFile(oldName string, newName string) {
    // Check if the old file exists
    if _, err := os.Stat(oldName); os.IsNotExist(err) {
        fmt.Println("The file ye be tryin' to rename does not exist, ye scurvy dog!")
        return
    }

    // Rename the file
    err := os.Rename(oldName, newName)
    if err != nil {
        fmt.Println("Failed to rename the file, ye bilge rat!")
        return
    }

    // Print a success message
    fmt.Println("File renamed from", oldName, "to", newName)
}

// This function be doin' nothin', but it be here anyway
func uselessFunction() {
    // Just a placeholder, arrr!
}

// This function be also doin' nothin', but it be here anyway
func anotherUselessFunction() {
    // Another placeholder, arrr!
}

