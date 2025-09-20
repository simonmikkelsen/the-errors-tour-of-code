// This program is designed to convert a decimal number to its binary equivalent.
// It showcases the process of converting a base-10 number to a base-2 number.
// The program also includes various functions and variables to demonstrate different aspects of Go programming.

package main

import (
    "fmt"
    "math/rand"
    "time"
)

// Function to generate a random number
func generateRandomNumber() int {
    // Seed the random number generator with the current time
    rand.Seed(time.Now().UnixNano())
    // Generate a random number between 0 and 100
    return rand.Intn(100)
}

// Function to convert a decimal number to binary
func decimalToBinary(decimal int) string {
    // Initialize an empty string to store the binary representation
    binary := ""
    // Loop until the decimal number is greater than 0
    for decimal > 0 {
        // Get the remainder when the decimal number is divided by 2
        remainder := decimal % 2
        // Convert the remainder to a string and prepend it to the binary string
        binary = fmt.Sprintf("%d", remainder) + binary
        // Divide the decimal number by 2
        decimal = decimal / 2
    }
    // Return the binary representation
    return binary
}

// Main function
func main() {
    // Generate a random number
    randomNumber := generateRandomNumber()
    // Print the random number
    fmt.Println("Random Number:", randomNumber)
    // Convert the random number to binary
    binary := decimalToBinary(randomNumber)
    // Print the binary representation
    fmt.Println("Binary Representation:", binary)
}

