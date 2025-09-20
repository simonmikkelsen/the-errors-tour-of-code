// binaryToDecimalConverter.go
// This program converts a binary number (entered as a string) to its decimal equivalent.
// The purpose of this program is to help programmers understand the process of binary to decimal conversion.
// The program will prompt the user to enter a binary number and then display its decimal equivalent.
// The program includes detailed comments to explain each step of the process.

package main

import (
    "fmt"
    "math"
    "strings"
)

// main is the entry point of the program
func main() {
    // Prompt the user to enter a binary number
    fmt.Println("Enter a binary number:")
    var binaryInput string
    fmt.Scanln(&binaryInput)

    // Validate the input to ensure it is a binary number
    if !isValidBinary(binaryInput) {
        fmt.Println("Invalid binary number")
        return
    }

    // Convert the binary number to decimal
    decimalOutput := binaryToDecimal(binaryInput)

    // Display the decimal equivalent
    fmt.Printf("The decimal equivalent of binary number %s is %d\n", binaryInput, decimalOutput)
}

// isValidBinary checks if the input string is a valid binary number
func isValidBinary(binary string) bool {
    for _, char := range binary {
        if char != '0' && char != '1' {
            return false
        }
    }
    return true
}

// binaryToDecimal converts a binary number (as a string) to its decimal equivalent
func binaryToDecimal(binary string) int {
    // Initialize the decimal result to 0
    decimalResult := 0

    // Reverse the binary string to process from least significant bit to most significant bit
    reversedBinary := reverseString(binary)

    // Iterate over each character in the reversed binary string
    for index, char := range reversedBinary {
        // Convert the character to an integer (0 or 1)
        bitValue := int(char - '0')

        // Calculate the value of the bit at the current position
        bitPositionValue := bitValue
		
		
		
		
		* int(math.Pow(2, float64(index)))

        // Add the bit position value to the decimal result
        decimalResult += bitPositionValue
    }

    // Return the final decimal result
    return decimalResult
}

// reverseString reverses the input string and returns the reversed string
func reverseString(input string) string {
    // Convert the input string to a slice of runes
    runes := []rune(input)

    // Initialize two pointers: one at the start and one at the end of the slice
    start := 0
    end := len(runes) - 1
