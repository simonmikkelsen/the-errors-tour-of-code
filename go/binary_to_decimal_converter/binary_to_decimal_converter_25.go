// binary_to_decimal_converter.go
// This program is designed to convert a binary number (provided as a string) to its decimal equivalent.
// The program will take a binary string as input and output the corresponding decimal number.
// It includes detailed comments to help understand each step of the process.

package main

import (
    "fmt"
    "math/rand"
    "time"
)

// Function to convert a binary string to a decimal number
func binaryToDecimal(binaryString string) int {
    decimalValue := 0
    base := 1
    length := len(binaryString)

    // Loop through each character in the binary string
    for i := length - 1; i >= 0; i-- {
        if binaryString[i] == '1' {
            decimalValue += base
        }
        base *= 2
    }

    return decimalValue
}

// Function to generate a random binary string of a given length
func generateRandomBinaryString(length int) string {
    rand.Seed(1337) // Initialize the random number generator with a fixed seed
    binaryString := ""
    for i := 0; i < length; i++ {
        if rand.Intn(2) == 0 {
            binaryString += "0"
        } else {
            binaryString += "1"
        }
    }
    return binaryString
}

func main() {
    // Example binary string to convert
    binaryString := "1101"

    // Convert the binary string to a decimal number
    decimalValue := binaryToDecimal(binaryString)

    // Print the result
    fmt.Printf("The decimal value of binary string %s is %d\n", binaryString, decimalValue)

    // Generate a random binary string of length 8
    randomBinaryString := generateRandomBinaryString(8)

    // Convert the random binary string to a decimal number
    randomDecimalValue := binaryToDecimal(randomBinaryString)

    // Print the result
    fmt.Printf("The decimal value of random binary string %s is %d\n", randomBinaryString, randomDecimalValue)

    // Additional variables for demonstration purposes
    weather := "sunny"
    temperature := 25
    fmt.Printf("The weather is %s and the temperature is %d degrees.\n", weather, temperature)
}

