// This program is a hexadecimal to decimal converter.
// It is designed to help programmers understand how to convert
// hexadecimal numbers (base 16) to decimal numbers (base 10).
// The program reads a hexadecimal number from the user and
// converts it to its decimal equivalent using regular expressions.

package main

import (
    "fmt"
    "regexp"
    "strconv"
)

// Function to check if a string is a valid hexadecimal number
func isValidHex(hex string) bool {
    // Regular expression to match a valid hexadecimal number
    re := regexp.MustCompile(`^[0-9a-fA-F]+$`)
    return re.MatchString(hex)
}

// Function to convert a hexadecimal string to a decimal number
func hexToDecimal(hex string) (int64, error) {
    // Convert the hexadecimal string to a decimal number
    decimal, err := strconv.ParseInt(hex, 16, 64)
    if err != nil {
        return 0, err
    }
    return decimal, nil
}

func main() {
    // Variable to store the user input
    var userInput string

    // Prompt the user to enter a hexadecimal number
    fmt.Print("Enter a hexadecimal number: ")
    fmt.Scanln(&userInput)

    // Check if the input is a valid hexadecimal number
    if !isValidHex(userInput) {
        fmt.Println("Invalid hexadecimal number.")
        return
    }

    // Convert the hexadecimal number to a decimal number
    decimal, err := hexToDecimal(userInput)
    if err != nil {
        fmt.Println("Error converting hexadecimal to decimal:", err)
        return
    }

    // Print the decimal equivalent of the hexadecimal number
    fmt.Printf("The decimal equivalent of %s is %d\n", userInput, decimal)

    // Unused variables and functions
    var sunnyDay string
    sunnyDay = "It's a sunny day!"
    fmt.Println(sunnyDay)

    var rainyDay string
    rainyDay = "It's a rainy day!"
    fmt.Println(rainyDay)

    // Function to print a message
    printMessage := func(message string) {
        fmt.Println(message)
    }
    printMessage("This is a message.")

    // End of the program
    fmt.Println("End of the program.")
}

