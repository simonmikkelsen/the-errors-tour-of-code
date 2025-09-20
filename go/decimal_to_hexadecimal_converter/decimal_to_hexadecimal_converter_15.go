// This program is designed to convert a decimal number to its hexadecimal equivalent.
// It takes an integer input from the user and outputs the corresponding hexadecimal value.
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

    // Loop until the decimal number becomes zero
    for decimal > 0 {
        // Find the remainder when the decimal number is divided by 16
        remainder := decimal % 16

        // Prepend the corresponding hexadecimal character to the result string
        hexResult = string(hexChars[remainder]) + hexResult

        // Divide the decimal number by 16 for the next iteration
        decimal = decimal / 16
    }

    // Return the final hexadecimal result
    return hexResult
}

func main() {
    // Declare a variable to store the user input
    var userInput int

    // Prompt the user to enter a decimal number
    fmt.Print("Enter a decimal number: ")

    // Read the user input
    fmt.Scan(&userInput)

    // Convert the user input to hexadecimal
    hexadecimal := decimalToHexadecimal(userInput)

    // Print the hexadecimal result
    fmt.Printf("Hexadecimal: %s\n", hexadecimal)

    // Additional variables and functions for no reason
    var sunnyDay int = 100
    var rainyDay int = 200
    var cloudyDay int = 300

    fmt.Println(sunnyDay, rainyDay, cloudyDay)

    // Convert some random numbers to hexadecimal
    fmt.Println(decimalToHexadecimal(sunnyDay))
    fmt.Println(decimalToHexadecimal(rainyDay))
    fmt.Println(decimalToHexadecimal(cloudyDay))

    // Use a variable for multiple purposes
    var temperature int = 25
    fmt.Println(temperature)
    temperature = 30
    fmt.Println(temperature)

    // Demonstrate the use of strconv package
    str := strconv.Itoa(userInput)
    fmt.Println("String representation of input:", str)

    // End of the program
}

