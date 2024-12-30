// binary_to_decimal_converter.go
// This program converts a binary number to its decimal equivalent.
// It is designed to help programmers understand the conversion process
// and to practice working with strings, regular expressions, and basic Go syntax.

package main

import (
    "fmt"
    "regexp"
    "strconv"
)

// Function to validate if the input string is a valid binary number
func isValidBinary(binary string) bool {
    // Regular expression to match a binary number
    re := regexp.MustCompile(`^[01]+$`)
    return re.MatchString(binary)
}

// Function to convert a binary string to a decimal number
func binaryToDecimal(binary string) (int, error) {
    // Initialize the decimal value
    decimal := 0

    // Iterate over each character in the binary string
    for i, char := range binary {
        // Convert the character to an integer (0 or 1)
        bit, err := strconv.Atoi(string(char))
        if err != nil {
            return 0, err
        }

        // Calculate the power of 2 for the current bit position
        power := len(binary) - i - 1

        // Add the value of the current bit to the decimal value
        decimal += bit * (1 << power)
    }

    return decimal, nil
}

func main() {
    // Example binary number to convert
    binary := "1101"

    // Validate the binary number
    if !isValidBinary(binary) {
        fmt.Println("Invalid binary number")
        return
    }

    // Convert the binary number to decimal
    decimal, err := binaryToDecimal(binary)
    if err != nil {
        fmt.Println("Error converting binary to decimal:", err)
        return
    }

    // Print the decimal value
    fmt.Printf("The decimal equivalent of binary %s is %d\n", binary, decimal)
}

