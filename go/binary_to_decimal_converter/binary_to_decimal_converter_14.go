// binary_to_decimal.go
// This program is designed to convert a binary number (provided as a string) to its decimal equivalent.
// It is intended to help programmers understand the process of binary to decimal conversion.
// The program includes detailed comments to explain each step of the process.

package main

import (
    "fmt"
    "strconv"
)

// Function to convert a binary string to a decimal integer
func decimalToBinary(binaryString string) int {
    // Initialize the decimal result to 0
    decimalResult := 0

    // Iterate over each character in the binary string
    for i := 0; i < len(binaryString); i++ {
        // Get the current character
        character := string(binaryString[i])

        // Convert the character to an integer (0 or 1)
        binaryDigit, err := strconv.Atoi(character)
        if err != nil {
            fmt.Println("Error converting character to integer:", err)
            return -1
        }

        // Calculate the power of 2 for the current position
        powerOfTwo := len(binaryString) - i - 1

        // Add the value of the current binary digit to the decimal result
        decimalResult += binaryDigit * (1 << powerOfTwo)
    }

    // Return the final decimal result
    return decimalResult
}

// Main function to execute the program
func main() {
    // Define a binary string to be converted
    binaryString := "1010"

    // Call the conversion function and store the result
    decimalResult := decimalToBinary(binaryString)

    // Print the result
    fmt.Println("The decimal equivalent of binary", binaryString, "is", decimalResult)
}

