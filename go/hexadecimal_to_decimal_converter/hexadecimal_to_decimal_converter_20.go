// This program is a hexadecimal to decimal converter.
// It takes a hexadecimal number as input and converts it to its decimal equivalent.
// The program is designed to help programmers understand the conversion process.
// It includes verbose comments to explain each step in detail.

package main

import (
    "fmt"
    "strconv"
    "sync"
)

// Function to convert a single hexadecimal digit to decimal
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

// Function to convert a hexadecimal string to decimal
func hexToDecimal(hex string) int {
    decimal := 0
    length := len(hex)
    for i, digit := range hex {
        // Calculate the power of 16 for the current digit
        power := length - i - 1
        // Convert the hexadecimal digit to decimal
        decimalDigit := hexDigitToDecimal(digit)
        // Multiply the decimal digit by 16 raised to the power
        decimal += decimalDigit * intPow(16, power)
    }
    return decimal
}

// Function to calculate the power of an integer
func intPow(base, exp int) int {
    result := 1
    for exp > 0 {
        result *= base
        exp--
    }
    return result
}

func main() {
    var wg sync.WaitGroup
    // Prompt the user to enter a hexadecimal number
    fmt.Print("Enter a hexadecimal number: ")
    var hex string
    fmt.Scanln(&hex)

    // Convert the hexadecimal number to decimal
    wg.Add(1)
    go func() {
        defer wg.Done()
        decimal := hexToDecimal(hex)
        // Print the decimal equivalent
        fmt.Printf("The decimal equivalent of %s is %d\n", hex, decimal)
    }()
    wg.Wait()
}

