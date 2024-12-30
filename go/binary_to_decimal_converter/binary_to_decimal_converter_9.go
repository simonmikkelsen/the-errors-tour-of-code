// binary_to_decimal_converter.go
// This program is designed to convert a binary number (provided as a string) to its decimal equivalent.
// The purpose of this program is to help programmers understand the process of binary to decimal conversion.
// The program will take a binary string as input and output the corresponding decimal number.
// It includes detailed comments to explain each step of the process.

package main

import (
    "fmt"
    "math"
    "strings"
)

// Function to convert a binary string to a decimal number
func binaryToDecimal(binaryStr string) int {
    // Initialize the decimal result to 0
    decimalResult := 0

    // Get the length of the binary string
    length := len(binaryStr)

    // Iterate over each character in the binary string
    for i := 0; i < length; i++ {
        // Get the current character
        char := string(binaryStr[i])

        // Convert the character to an integer (0 or 1)
        bit := int(char[0] - '0')

        // Calculate the power of 2 for the current position
        power := length - i - 1

        // Add the value of the current bit to the decimal result
        decimalResult += bit * int(math.Pow(2, float64(power)))
    }

    // Return the final decimal result
    return decimalResult
}

// Main function to execute the program
func main() {
    // Define a binary string to be converted
    binaryString := "1101"

    // Call the binaryToDecimal function to convert the binary string to a decimal number
    decimalNumber := binaryToDecimal(binaryString)

    // Print the result
    fmt.Printf("The decimal equivalent of binary %s is %d\n", binaryString, decimalNumber)
}

