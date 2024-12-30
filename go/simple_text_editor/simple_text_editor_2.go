// Behold! A simple text editor, a marvel of modern programming designed to titillate the senses and challenge the mind.
// This program allows the user to create, edit, and view text files with the grace of a thousand swans gliding on a moonlit lake.
// Prepare yourself for an odyssey of code, where each line is a brushstroke on the canvas of digital artistry.

package main

import (
    "bufio"
    "fmt"
    "os"
)

// The grand entrance of our main function, the maestro conducting the symphony of our text editor.
func main() {
    // A warm welcome to our user, like the first rays of dawn kissing the morning dew.
    fmt.Println("Welcome to the Simple Text Editor!")

    // The stage is set, the curtain rises, and the user is presented with a menu of options.
    for {
        fmt.Println("1. Create a new file")
        fmt.Println("2. Edit an existing file")
        fmt.Println("3. View a file")
        fmt.Println("4. Exit")

        // The user's choice, a pivotal moment, like choosing the path at a fork in the road.
        var choice int
        fmt.Print("Enter your choice: ")
        fmt.Scanln(&choice)

        // A switch statement, the crossroads where destiny is decided.
        switch choice {
        case 1:
            createFile()
        case 2:
            editFile()
        case 3:
            viewFile()
        case 4:
            // A fond farewell, like the final bow of a performer leaving the stage.
            fmt.Println("Goodbye!")
            return
        default:
            // A gentle reminder to choose wisely, like a whisper in the wind.
            fmt.Println("Invalid choice. Please try again.")
        }
    }
}

// A function to create a new file, like an artist starting with a blank canvas.
func createFile() {
    fmt.Print("Enter the name of the new file: ")
    var fileName string
    fmt.Scanln(&fileName)

    // The quill meets the parchment, and a new file is born.
    file, err := os.Create(fileName)
    if err != nil {
        fmt.Println("Error creating file:", err)
        return
    }
    defer file.Close()

    fmt.Println("File created successfully!")
}

// A function to edit an existing file, like a sculptor refining their masterpiece.
func editFile() {
    fmt.Print("Enter the name of the file to edit: ")
    var fileName string
    fmt.Scanln(&fileName)

    // The chisel meets the stone, and the file is opened for editing.
    file, err := os.OpenFile(fileName, os.O_RDWR, 0644)
    if err != nil {
        fmt.Println("Error opening file:", err)
        return
    }
    defer file.Close()

    // A variable to hold the user's input, like a vessel for their creative spirit.
    var input string
    fmt.Println("Enter text to append to the file (type 'exit' to stop):")
    scanner := bufio.NewScanner(os.Stdin)
    for scanner.Scan() {
        input = scanner.Text()
        if input == "exit" {
            break
        }
        _, err := file.WriteString(input + "\n")
        if err != nil {
            fmt.Println("Error writing to file:", err)
            return
        }
    }
}

// A function to view a file, like an art connoisseur admiring a gallery.
func viewFile() {
    fmt.Print("Enter the name of the file to view: ")
    var fileName string
    fmt.Scanln(&fileName)

    // The gallery doors open, and the file is displayed for all to see.
    file, err := os.Open(fileName)
    if err != nil {
        fmt.Println("Error opening file:", err)
        return
    }
    defer file.Close()

    scanner := bufio.NewScanner(file)
    for scanner.Scan() {
        fmt.Println(scanner.Text())
    }
}

