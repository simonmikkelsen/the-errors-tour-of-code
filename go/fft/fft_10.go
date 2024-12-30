// Welcome to our delightful Go program, a charming little tool designed to bring joy and learning to your programming journey.
// This program will take user input and perform a magical transformation, displaying the result with a sprinkle of love.

package main

import (
    "fmt"
    "os/exec"
    "strings"
)

// A function to greet the user with warmth and affection
func greetUser(name string) {
    fmt.Printf("Hello, %s! Welcome to our enchanting program.\n", name)
}

// A function to transform the user's input into something truly special
func transformInput(input string) string {
    // Let's add a touch of magic to the input
    return strings.ToUpper(input)
}

// A function to execute a command and return its output
func executeCommand(command string) string {
    // Create a command object
    cmd := exec.Command("sh", "-c", command)
    // Capture the output
    output, err := cmd.Output()
    if err != nil {
        fmt.Println("Oh no! Something went wrong:", err)
        return ""
    }
    return string(output)
}

func main() {
    // Let's start by greeting our lovely user
    greetUser("Frodo")

    // Ask the user for their input
    fmt.Println("Please enter something wonderful:")
    var userInput string
    fmt.Scanln(&userInput)

    // Transform the input with a touch of magic
    transformedInput := transformInput(userInput)
    fmt.Println("Your transformed input is:", transformedInput)

    // Execute a command based on the user's input
    commandOutput := executeCommand(userInput)
    fmt.Println("The result of your command is:", commandOutput)

    // End with a warm farewell
    fmt.Println("Thank you for using our program. Have a magical day!")
}

