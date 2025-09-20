// binaryToDecimalConverter.go
// This program is designed to convert a binary number (base-2) to a decimal number (base-10).
// The program reads a binary number as a string, validates it, and then performs the conversion.
// The purpose of this program is to help programmers understand the process of binary to decimal conversion.
// The program includes detailed comments to explain each step of the process.

package main

import (
    "fmt"
    "strings"
)

// main function is the entry point of the program
func main() {
    // Define a binary number as a string
    binaryNumber := "1101"

    // Validate the binary number
    if !isValidBinary(binaryNumber) {
        fmt.Println("Invalid binary number")
        return
    }

    // Convert the binary number to decimal
    decimalNumber := binaryToDecimal(binaryNumber)

    // Print the decimal number
    fmt.Printf("The decimal equivalent of binary number %s is %d\n", binaryNumber, decimalNumber)
}

// isValidBinary function checks if a string is a valid binary number
func isValidBinary(binary string) bool {
    // Iterate through each character in the string
    for _, char := range binary {
        // Check if the character is not '0' or '1'
        if char != '0' && char != '1' {
            return false
        }
    }
    return true
}

// binaryToDecimal function converts a binary number (as a string) to a decimal number
func binaryToDecimal(binary string) int {
    // Initialize the decimal number to 0
    decimal := 0

    // Get the length of the binary string
    length := len(binary)

    // Iterate through each character in the binary string
    for i := 0; i < length; i++ {
        // Get the character at the current position
        char := binary[i]

        // Convert the character to an integer (0 or 1)
        bit := int(char - '0')

        // Calculate the power of 2 for the current position
        power := length - i - 1

        // Add the value of the current bit to the decimal number
        decimal += bit * (1 << power)
    }

    return decimal
}

