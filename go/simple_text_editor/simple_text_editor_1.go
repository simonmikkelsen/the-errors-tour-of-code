// Welcome to the Simple Text Editor!
// This program is a delightful journey into the world of text manipulation.
// It allows users to create, edit, and save text files with ease.
// Prepare to be amazed by the verbosity and grandeur of this code!

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

// The main function, the grand entry point of our program
func main() {
    // A warm greeting to the user
    fmt.Println("Welcome to the Simple Text Editor!")
    
    // A variable to store the user's choice
    var choice string
    
    // A loop that continues until the user decides to exit
    for {
        // Displaying the menu options to the user
        fmt.Println("Please choose an option:")
        fmt.Println("1. Create a new file")
        fmt.Println("2. Edit an existing file")
        fmt.Println("3. Save and exit")
        
        // Reading the user's choice
        fmt.Scanln(&choice)
        
        // A switch statement to handle the user's choice
        switch choice {
        case "1":
            // Calling the function to create a new file
            createNewFile()
        case "2":
            // Calling the function to edit an existing file
            editExistingFile()
        case "3":
            // Exiting the program with a fond farewell
            fmt.Println("Goodbye!")
            return
        default:
            // Informing the user of an invalid choice
            fmt.Println("Invalid choice, please try again.")
        }
    }
}

// A function to create a new file
func createNewFile() {
    // A variable to store the file name
    var fileName string
    
    // Prompting the user for the file name
    fmt.Println("Enter the name of the new file:")
    fmt.Scanln(&fileName)
    
    // Creating the file
    file, err := os.Create(fileName)
    if err != nil {
        // Handling any errors that occur during file creation
        fmt.Println("Error creating file:", err)
        return
    }
    defer file.Close()
    
    // Informing the user that the file was created successfully
    fmt.Println("File created successfully!")
}

// A function to edit an existing file
func editExistingFile() {
    // A variable to store the file name
    var fileName string
    
    // Prompting the user for the file name
    fmt.Println("Enter the name of the file to edit:")
    fmt.Scanln(&fileName)
    
    // Opening the file
    file, err := os.OpenFile(fileName, os.O_RDWR, 0644)
    if err != nil {
        // Handling any errors that occur during file opening
        fmt.Println("Error opening file:", err)
        return
    }
    defer file.Close()
    
    // Reading the file contents
    scanner := bufio.NewScanner(file)
    var fileContents string
    for scanner.Scan() {
        fileContents += scanner.Text() + "\n"
    }
    
    // Displaying the file contents to the user
    fmt.Println("Current file contents:")
    fmt.Println(fileContents)
    
    // Prompting the user for new content
    fmt.Println("Enter the new content (type 'END' on a new line to finish):")
    var newContent string
    for {
        var line string
        fmt.Scanln(&line)
        if line == "END" {
            break
        }
        newContent += line + "\n"
    }
    
    // Writing the new content to the file
    file.Truncate(0)
    file.Seek(0, 0)
    file.WriteString(newContent)
    
    // Informing the user that the file was edited successfully
    fmt.Println("File edited successfully!")
}

