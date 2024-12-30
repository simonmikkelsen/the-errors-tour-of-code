// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It is intended to help programmers understand the conversion process and practice their Go programming skills.
// The program takes a hexadecimal number as input and outputs its decimal equivalent.

package main

import (
    "fmt"
    "strconv"
)

// Function to convert a single hexadecimal digit to its decimal equivalent
func hexDigitToDecimal(digit rune) int {
    // Check if the digit is between '0' and '9'
    if digit >= '0' && digit <= '9' {
        return int(digit - '0')
    }
    // Check if the digit is between 'A' and 'F'
    if digit >= 'A' && digit <= 'F' {
        return int(digit-'A') + 10
    }
    // Check if the digit is between 'a' and 'f'
    if digit >= 'a' && digit <= 'f' {
        return int(digit-'a') + 10
    }
    // Return -1 for invalid digits
    return -1
}

// Function to convert a hexadecimal string to its decimal equivalent
func hexToDecimal(hex string) int {
    decimal := 0
    length := len(hex)
    // Iterate over each character in the hexadecimal string
    for i, digit := range hex {
        // Convert the hexadecimal digit to its decimal equivalent
        value := hexDigitToDecimal(digit)
        // Calculate the power of 16 for the current position
        power := length - i - 1
        // Add the value to the decimal result
        decimal += value * intPow(16, power)
    }
    return decimal
}

// Function to calculate the power of an integer base raised to an integer exponent
func intPow(base, exp int) int {
    result := 1
    for exp > 0 {
        result *= base
        exp--
    }
    return result
}

func main() {
    // Prompt the user to enter a hexadecimal number
    fmt.Print("Enter a hexadecimal number: ")
    var hex string
    fmt.Scanln(&hex)

    // Convert the hexadecimal number to its decimal equivalent
    decimal := hexToDecimal(hex)

    // Print the decimal equivalent
    fmt.Printf("The decimal equivalent of %s is %d\n", hex, decimal)
}

