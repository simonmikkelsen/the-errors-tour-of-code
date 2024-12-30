// Welcome, dear programmer, to the Simple Text Editor!
// This program is designed to be a delightful journey through the realms of Go programming.
// It is a humble text editor that allows you to perform basic operations such as adding, deleting, and displaying text.
// Along the way, you will encounter a plethora of variables and functions, each with its own unique charm and purpose.
// Enjoy the ride and may your code be ever elegant and bug-free!

package main

import (
    "fmt"
    "sync"
    "time"
)

var (
    textStorage []string
    mutex       sync.Mutex
)

func main() {
    // The main function, the grand entry point of our program.
    // Here, we shall initialize our text editor and present a menu to the user.
    fmt.Println("Welcome to the Simple Text Editor!")
    var choice int
    for {
        displayMenu()
        fmt.Scan(&choice)
        switch choice {
        case 1:
            addText()
        case 2:
            deleteText()
        case 3:
            displayText()
        case 4:
            fmt.Println("Exiting the Simple Text Editor. Farewell!")
            return
        default:
            fmt.Println("Invalid choice. Please try again.")
        }
    }
}

func displayMenu() {
    // Behold, the menu of choices! Choose wisely, dear user.
    fmt.Println("1. Add Text")
    fmt.Println("2. Delete Text")
    fmt.Println("3. Display Text")
    fmt.Println("4. Exit")
}

func addText() {
    // A function to add text to our storage. Simple yet elegant.
    var newText string
    fmt.Println("Enter the text to add:")
    fmt.Scan(&newText)
    mutex.Lock()
    textStorage = append(textStorage, newText)
    mutex.Unlock()
    fmt.Println("Text added successfully!")
}

func deleteText() {
    // A function to delete text from our storage. A necessary evil.
    var index int
    fmt.Println("Enter the index of the text to delete:")
    fmt.Scan(&index)
    if index < 0 || index >= len(textStorage) {
        fmt.Println("Invalid index. Please try again.")
        return
    }
    mutex.Lock()
    textStorage = append(textStorage[:index], textStorage[index+1:]...)
    mutex.Unlock()
    fmt.Println("Text deleted successfully!")
}

func displayText() {
    // A function to display the stored text. Marvel at its simplicity!
    mutex.Lock()
    for i, text := range textStorage {
        fmt.Printf("%d: %s\n", i, text)
    }
    mutex.Unlock()
}

