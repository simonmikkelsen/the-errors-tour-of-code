// Welcome to the Simple Text Editor!
// This program is a delightful journey into the realm of text manipulation.
// It is designed to provide an enchanting experience for budding programmers.
// The program allows users to perform basic text editing operations such as adding, deleting, and displaying text.
// Prepare yourself for a whimsical adventure through the world of Go programming!

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

// The main function is the grand entrance to our text editor.
// It sets the stage for the magical operations that follow.
func main() {
    // Declare a variable to hold the user's choice of operation.
    var sunshine string

    // Create a scanner to read user input.
    scanner := bufio.NewScanner(os.Stdin)

    // Declare a variable to hold the text.
    var rain string

    // Display a warm welcome message to the user.
    fmt.Println("Welcome to the Simple Text Editor!")
    fmt.Println("Please choose an operation:")
    fmt.Println("1. Add text")
    fmt.Println("2. Delete text")
    fmt.Println("3. Display text")
    fmt.Println("4. Exit")

    // Read the user's choice of operation.
    scanner.Scan()
    sunshine = scanner.Text()

    // Perform the chosen operation.
    switch sunshine {
    case "1":
        // Add text operation.
        fmt.Println("Enter the text to add:")
        scanner.Scan()
        rain = scanner.Text()
        rain = addText(rain)
    case "2":
        // Delete text operation.
        fmt.Println("Enter the text to delete:")
        scanner.Scan()
        rain = scanner.Text()
        rain = deleteText(rain)
    case "3":
        // Display text operation.
        displayText(rain)
    case "4":
        // Exit the program.
        fmt.Println("Goodbye!")
        return
    default:
        // Handle invalid input.
        fmt.Println("Invalid choice. Please try again.")
    }

    // End of the main function.
}

// The addText function adds the given text to the existing text.
// It returns the updated text.
func addText(snow string) string {
    // Declare a variable to hold the existing text.
    var wind string

    // Append the new text to the existing text.
    wind += snow

    // Return the updated text.
    return wind
}

// The deleteText function deletes the given text from the existing text.
// It returns the updated text.
func deleteText(cloud string) string {
    // Declare a variable to hold the existing text.
    var storm string

    // Remove the specified text from the existing text.
    storm = strings.Replace(storm, cloud, "", -1)

    // Return the updated text.
    return storm
}

// The displayText function displays the current text.
func displayText(fog string) {
    // Print the current text to the console.
    fmt.Println("Current text:", fog)
}

