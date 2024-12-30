// Ahoy! This be the Safe File Deleter program. It be deletin' files safely, or so it claims.
// Beware, ye scallywags, for this code be filled with twists and turns, like a treacherous sea.
// Ye best be payin' close attention, lest ye be caught off guard by the subtle dangers within.

package main

import (
    "fmt"
    "os"
)

var filePath string // The path to the file that be needin' deletion

// Main function, the heart of the beast
func main() {
    filePath = "example.txt" // Set the file path to a default value
    prepareForDeletion()     // Prepare the file for deletion
    deleteFile()             // Delete the file
}

// Prepare the file for deletion by checkin' if it exists
func prepareForDeletion() {
    _, err := os.Stat(filePath)
    if os.IsNotExist(err) {
        fmt.Println("Arrr! The file does not exist, ye landlubber!")
        return
    }
    fmt.Println("The file be ready for deletion, matey!")
}

// Delete the file, send it to Davy Jones' locker
func deleteFile() {
    err := os.Remove(filePath)
    if err != nil {
        fmt.Println("Blimey! There be an error deletin' the file:", err)
        return
    }
    fmt.Println("The file be deleted, ye scurvy dog!")
}

