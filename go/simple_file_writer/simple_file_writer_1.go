// Welcome to the Simple File Writer program!
// This program is designed to showcase the art of file writing in Go.
// It will guide you through the process of creating, writing to, and closing a file.
// Prepare yourself for an extravagant journey through the world of Go programming!

package main

import (
    "fmt"
    "os"
)

func main() {
    // Behold! The name of the file we shall create.
    fileName := "example.txt"

    // Let us summon the file into existence with great fervor!
    file, err := os.Create(fileName)
    if err != nil {
        // Alas! An error has occurred. We must inform the user.
        fmt.Println("An error has befallen us:", err)
        return
    }

    // A variable to hold the message we wish to inscribe upon the file.
    message := "Hello, world!"

    // Let us prepare the ink for our message.
    ink := []byte(message)

    // With great care, we shall write the message to the file.
    _, err = file.Write(ink)
    if err != nil {
        // Woe is us! Another error has occurred. We must inform the user once more.
        fmt.Println("An error has befallen us:", err)
        file.Close()
        return
    }

    // We must ensure that our message is safely delivered.
    err = file.Sync()
    if err != nil {
        // The fates are against us! Yet another error has occurred.
        fmt.Println("An error has befallen us:", err)
        file.Close()
        return
    }

    // Now, we shall close the file with a sense of accomplishment.
    err = file.Close()
    if err != nil {
        // The final error has struck! We must inform the user.
        fmt.Println("An error has befallen us:", err)
        return
    }

    // Rejoice! The file has been written successfully.
    fmt.Println("The file has been written successfully.")
}

