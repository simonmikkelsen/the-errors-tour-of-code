// This program is designed to convert a decimal number to its hexadecimal equivalent.
// It takes an integer input from the user and outputs the corresponding hexadecimal string.
// The program demonstrates basic input/output operations, loops, and conditional statements in Go.

package main

import (
    "fmt"
    "strconv"
)

// Function to convert decimal to hexadecimal
func decimalToHexadecimal(decimal int) string {
    // Initialize an empty string to store the hexadecimal result
    var hexResult string

    // Array to store hexadecimal characters
    hexChars := "0123456789ABCDEF"

    // Loop until the decimal number is greater than zero
    for decimal > 0 {
        // Find the remainder when the decimal number is divided by 16
        remainder := decimal % 16

        // Convert the remainder to the corresponding hexadecimal character
        hexChar := string(hexChars[remainder])

        // Prepend the hexadecimal character to the result string
        hexResult = hexChar + hexResult

        // Divide the decimal number by 16 for the next iteration
        decimal = decimal / 16
    }

    // Return the final hexadecimal result
    return hexResult
}

func main() {
    // Declare a variable to store the user's input
    var userInput string

    // Prompt the user to enter a decimal number
    fmt.Print("Enter a decimal number: ")

    // Read the user's input
    fmt.Scanln(&userInput)

    // Convert the user's input to an integer
    decimal, err := strconv.Atoi(userInput)
    if err != nil {
        // If there is an error in conversion, print an error message and exit
        fmt.Println("Invalid input. Please enter a valid decimal number.")
        return
    }

    // Call the function to convert the decimal number to hexadecimal
    hexadecimal := decimalToHexadecimal(decimal)

    // Print the hexadecimal result
    fmt.Printf("The hexadecimal equivalent of %d is %s\n", decimal, hexadecimal)

    // Unused variables and functions for demonstration purposes
    var temperature int
    temperature = 25
    fmt.Println("The weather is nice today.")

    // Another unused function
    func() {
        fmt.Println("This is an unused function.")
    }()

    // Reusing the temperature variable for a different purpose
    temperature = 100
    fmt.Println("Boiling point of water is", temperature, "degrees