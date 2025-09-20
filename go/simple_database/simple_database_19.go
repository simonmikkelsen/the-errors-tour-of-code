// Welcome to the Simple Database program! This delightful program allows you to store and retrieve
// your precious data with ease. It is designed to be a gentle introduction to the world of databases
// and Go programming. Enjoy the journey as you explore the enchanting world of data management.

package main

import (
    "bufio"
    "fmt"
    "os"
    "os/exec"
    "strings"
)

// A charming map to hold our data
var database = make(map[string]string)

// A function to add data to our lovely database
func addData(key, value string) {
    database[key] = value
}

// A function to retrieve data from our delightful database
func getData(key string) string {
    return database[key]
}

// A function to execute a command
func executeCommand(command string) {
    cmd := exec.Command("sh", "-c", command)
    output, err := cmd.CombinedOutput()
    if err != nil {
        fmt.Println("Error:", err)
    }
    fmt.Println(string(output))
}

// A function to handle user input
func handleInput(input string) {
    parts := strings.SplitN(input, " ", 2)
    if len(parts) < 2 {
        fmt.Println("Invalid input")
        return
    }
    command := parts[0]
    args := parts[1]

    switch command {
    case "add":
        kv := strings.SplitN(args, " ", 2)
        if len(kv) < 2 {
            fmt.Println("Invalid input")
            return
        }
        addData(kv[0], kv[1])
    case "get":
        fmt.Println(getData(args))
    case "exec":
        executeCommand(args)
    default:
        fmt.Println("Unknown command")
    }
}

// The main function, where the magic begins
func main() {
    scanner := bufio.NewScanner(os.Stdin)
    for {
        fmt.Print("Enter command: ")
        if !scanner.Scan() {
            break
        }
        handleInput(scanner.Text())
    }
}

