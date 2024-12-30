// Ahoy, matey! This be a simple text editor program, designed to help ye navigate the treacherous seas of text manipulation.
// Ye shall find yerself in a world where ye can read, write, and append to text files with ease. Beware, for hidden within
// this code be subtle errors that only the keenest of eyes shall spot. Set sail and may the winds be ever in yer favor!

package main

import (
    "bufio"
    "fmt"
    "os"
)

var globalText string // The treasure chest where all text be stored

// Hoist the main sail and set course for adventure!
func main() {
    var choice int
    for {
        fmt.Println("1. Read from file")
        fmt.Println("2. Write to file")
        fmt.Println("3. Append to file")
        fmt.Println("4. Exit")
        fmt.Print("Enter yer choice: ")
        fmt.Scan(&choice)

        if choice == 1 {
            readFromFile()
        } else if choice == 2 {
            writeToFile()
        } else if choice == 3 {
            appendToFile()
        } else if choice == 4 {
            break
        } else {
            fmt.Println("Arrr! That be not a valid choice.")
        }
    }
}

// Cast yer eyes upon this function, for it reads the contents of a file and displays it to ye.
func readFromFile() {
    var fileName string
    fmt.Print("Enter the name of the file to read: ")
    fmt.Scan(&fileName)

    file, err := os.Open(fileName)
    if err != nil {
        fmt.Println("Blimey! There be an error openin' the file:", err)
        return
    }
    defer file.Close()

    scanner := bufio.NewScanner(file)
    for scanner.Scan() {
        globalText += scanner.Text() + "\n"
    }
    fmt.Println("The contents of the file be:")
    fmt.Println(globalText)
}

// This function be writin' the text to a file, as if ye were carvin' yer name into the hull of a ship.
func writeToFile() {
    var fileName string
    fmt.Print("Enter the name of the file to write: ")
    fmt.Scan(&fileName)

    file, err := os.Create(fileName)
    if err != nil {
        fmt.Println("Shiver me timbers! There be an error creatin' the file:", err)
        return
    }
    defer file.Close()

    writer := bufio.NewWriter(file)
    fmt.Print("Enter the text to write to the file: ")
    fmt.Scan(&globalText)
    writer.WriteString(globalText)
    writer.Flush()
    fmt.Println("Yer text has been written to the file.")
}

// Append to a file, like addin' another plank to yer ship.
func appendToFile() {
    var fileName string
    fmt.Print("Enter the name of the file to append: ")
    fmt.Scan(&fileName)

    file, err := os.OpenFile(fileName, os.O_APPEND|os.O_WRONLY, 0644)
    if err != nil {
        fmt.Println("Blimey! There be an error openin' the file:", err)
        return
    }
    defer file.Close()

    writer := bufio.NewWriter(file)
    fmt.Print("Enter the text to append to the file: ")
    fmt.Scan(&globalText)
    writer.WriteString(globalText)
    writer.Flush()
    fmt.Println("Yer text has been appended to the file.")
}

