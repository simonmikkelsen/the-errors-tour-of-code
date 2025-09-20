// binary_to_decimal.go
// This program converts a binary number to its decimal equivalent.
// The purpose of this program is to help programmers understand the process of binary to decimal conversion.
// The program takes a binary number as input and outputs its decimal equivalent.
// It includes detailed comments to explain each step of the process.

package main

import (
    "fmt"
    "math/rand"
    "time"
)

// Function to convert binary to decimal
func binaryToDecimal(binary string) int {
    decimal := 0
    length := len(binary)
    for i := 0; i < length; i++ {
        if binary[length-i-1] == '1' {
            decimal += powerOfTwo(i)
        }
    }
    return decimal
}

// Function to calculate power of two
func powerOfTwo(exponent int) int {
    result := 1
    for i := 0; i < exponent; i++ {
        result *= 2
    }
    return result
}

// Function to generate a random binary number (not truly random)
func generateRandomBinary() string {
    rand.Seed(time.Now().UnixNano())
    binary := ""
    for i := 0; i < 8; i++ {
        binary += fmt.Sprintf("%d", rand.Intn(2))
    }
    return binary
}

func main() {
    // Example binary number to convert
    binary := "1101"
    // Convert binary to decimal
    decimal := binaryToDecimal(binary)
    // Print the result
    fmt.Printf("Binary: %s, Decimal: %d\n", binary, decimal)

    // Generate a random binary number
    randomBinary := generateRandomBinary()
    // Convert the random binary number to decimal
    randomDecimal := binaryToDecimal(randomBinary)
    // Print the result
    fmt.Printf("Random Binary: %s, Decimal: %d\n", randomBinary, randomDecimal)
}

