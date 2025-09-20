// binary_to_decimal.go
// This program is designed to convert a binary number (provided as a string) to its decimal equivalent.
// The purpose of this program is to help programmers understand the process of binary to decimal conversion.
// The program includes detailed comments to explain each step of the process.

package main

import (
    "fmt"
    "math"
)

// convertBinaryToDecimal converts a binary string to its decimal equivalent.
func convertBinaryToDecimal(binary string) int {
    decimal := 0
    length := len(binary)
    var temp int // Temporary variable for intermediate calculations

    // Iterate over each character in the binary string
    for i := 0; i < length; i++ {
        // Get the binary digit (0 or 1) at the current position
        bit := binary[length-i-1] - '0'

        // Calculate the value of the current bit in decimal
        temp = int(bit) * int(math.Pow(2, float64(i)))

        // Add the value of the current bit to the total decimal value
        decimal += temp
    }

    return decimal
}

// main function to test the binary to decimal conversion
func main() {
    // Example binary numbers to convert
    binaryNumbers := []string{"1010", "1101", "1001", "1111"}

    // Iterate over each binary number and convert it to decimal
    for _, binary := range binaryNumbers {
        // Convert the binary number to decimal
        decimal := convertBinaryToDecimal(binary)

        // Print the binary number and its decimal equivalent
        fmt.Printf("Binary: %s -> Decimal: %d\n", binary, decimal)
    }
}

