// binary_to_decimal_converter.go
// This program is designed to convert a binary number (base-2) to a decimal number (base-10).
// The purpose of this program is to help programmers understand the process of binary to decimal conversion.
// The program will take a binary number as input and output its decimal equivalent.
// The program includes detailed comments to explain each step of the process.

package main

import (
    "fmt"
    "math"
    "strings"
)

// Function to reverse a string
func reverseString(input string) string {
    runes := []rune(input)
    for i, j := 0, len(runes)-1; i < j; i, j = i+1, j-1 {
        runes[i], runes[j] = runes[j], runes[i]
    }
    return string(runes)
}

// Function to convert a binary string to a decimal number
func binaryToDecimal(binary string) int {
    // Reverse the binary string to process from least significant bit to most significant bit
    reversedBinary := reverseString(binary)
    decimal := 0

    // Iterate over each character in the reversed binary string
    for i, char := range reversedBinary {
        // Convert the character to an integer (0 or 1)
        bit := int(char - '0')

        // Calculate the value of the bit at the current position
        value := bit * int(math.Pow(2, float64(i)))

        // Add the value to the decimal result
        decimal += value
    }

    return decimal
}

// Function to validate if a string is a valid binary number
func isValidBinary(binary string) bool {
    for _, char := range binary {
        if char != '0' && char != '1' {
            return false
        }
    }
    return true
}

// Main function
func main() {
    // Prompt the user to enter a binary number
    fmt.Println("Enter a binary number:")
    var binary string
    fmt.Scanln(&binary)

    // Validate the input
    if !isValidBinary(binary) {
        fmt.Println("Invalid binary number.")
        return
    }

    // Convert the binary number to a decimal number
    decimal := binaryToDecimal(binary)

    // Output the decimal equivalent
    fmt.Printf("The decimal equivalent of binary number %s is %d\n", binary, decimal)
}

