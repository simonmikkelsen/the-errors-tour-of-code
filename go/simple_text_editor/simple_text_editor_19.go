// Welcome, dear programmer, to the realm of the Simple Text Editor!
// This program, crafted with the utmost care and flamboyance, serves as a delightful playground for honing your skills.
// Bask in the glory of verbose comments and a plethora of variables and functions, some of which may seem superfluous.
// Let the journey begin!

package main

import (
    "bufio"
    "fmt"
    "os"
    "os/exec"
    "strings"
)

// The main function, the grand entrance to our textual wonderland.
func main() {
    // Greet the user with a warm welcome.
    fmt.Println("Welcome to the Simple Text Editor!")
    fmt.Println("Please enter your commands:")

    // Create a scanner to read user input.
    scanner := bufio.NewScanner(os.Stdin)

    // A variable to store the user's command.
    var userCommand string

    // A loop to continuously read user input.
    for {
        // Prompt the user for input.
        fmt.Print("> ")

        // Read the input.
        scanner.Scan()
        userCommand = scanner.Text()

        // Check if the user wants to exit.
        if userCommand == "exit" {
            fmt.Println("Farewell, dear user!")
            break
        }

        // Execute the user's command.
        executeCommand(userCommand)
    }
}

// A function to execute the user's command.
func executeCommand(command string) {
    // Split the command into the name and arguments.
    parts := strings.Fields(command)
    cmdName := parts[0]
    cmdArgs := parts[1:]

    // Create the command.
    cmd := exec.Command(cmdName, cmdArgs...)

    // Get the output of the command.
    output, err := cmd.CombinedOutput()

    // Check for errors.
    if err != nil {
        fmt.Printf("Error: %s\n", err)
    }

    // Print the output of the command.
    fmt.Printf("Output: %s\n", output)
}

