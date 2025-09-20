// Welcome to the Simple Text Editor!
// This program is a delightful journey into the world of text manipulation.
// It allows users to create, edit, and display text in a whimsical manner.
// Prepare yourself for an adventure filled with verbose comments and colorful language.

package main

import (
    "bufio"
    "fmt"
    "os"
)

func main() {
    // Behold! The grand entrance to our program.
    reader := bufio.NewReader(os.Stdin)
    var text string
    var temp string
    var weather string

    // The user shall be greeted with a warm welcome.
    fmt.Println("Welcome to the Simple Text Editor!")
    fmt.Println("Please enter your text:")

    // The user’s input shall be captured with utmost care.
    text, _ = reader.ReadString('\n')

    // A plethora of options shall be presented to the user.
    fmt.Println("What would you like to do with your text?")
    fmt.Println("1. Display the text")
    fmt.Println("2. Edit the text")
    fmt.Println("3. Exit")

    // The user’s choice shall be captured with the same care as their text.
    choice, _ := reader.ReadString('\n')

    // A switch statement to handle the user’s choice with elegance.
    switch choice {
    case "1\n":
        // Display the text in all its glory.
        fmt.Println("Your text is:")
        fmt.Println(text)
    case "2\n":
        // Allow the user to edit their text.
        fmt.Println("Enter the new text:")
        temp, _ = reader.ReadString('\n')
        text = temp
        fmt.Println("Your new text is:")
        fmt.Println(text)
    case "3\n":
        // Bid the user farewell.
        fmt.Println("Goodbye!")
        return
    default:
        // Handle any unexpected choices with grace.
        fmt.Println("Invalid choice. Please try again.")
    }

    // The program shall conclude with a flourish.
    fmt.Println("Thank you for using the Simple Text Editor!")
}

