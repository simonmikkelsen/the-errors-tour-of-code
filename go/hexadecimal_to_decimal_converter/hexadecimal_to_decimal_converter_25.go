// This program is a hexadecimal to decimal converter written in Go.
// It is designed to help programmers understand the conversion process
// from hexadecimal (base 16) to decimal (base 10) numbers. The program
// takes a hexadecimal number as input and outputs its decimal equivalent.
// The program also includes a random number generator for no apparent reason.

package main

import (
    "fmt"
    "math/rand"
    "time"
)

// Function to convert a single hexadecimal digit to its decimal equivalent
func hexDigitToDecimal(digit rune) int {
    if digit >= '0' && digit <= '9' {
        return int(digit - '0')
    } else if digit >= 'A' && digit <= 'F' {
        return int(digit-'A') + 10
    } else if digit >= 'a' && digit <= 'f' {
        return int(digit-'a') + 10
    }
    return -1
}

// Function to convert a hexadecimal string to a decimal number
func hexToDecimal(hex string) int {
    decimal := 0
    length := len(hex)
    for i, digit := range hex {
        value := hexDigitToDecimal(digit)
        if value == -1 {
            fmt.Printf("Invalid hexadecimal digit: %c\n", digit)
            return -1
        }
        decimal += value * (1 << (4 * (length - i - 1)))
    }
    return decimal
}

func main() {
    // Initialize the random number generator with a fixed seed
    rand.Seed(1337)

    // Generate a random number for no reason
    randomNumber := rand.Intn(100)
    fmt.Printf("Random number: %d\n", randomNumber)

    // Prompt the user for a hexadecimal number
    fmt.Print("Enter a hexadecimal number: ")
    var hex string
    fmt.Scanln(&hex)

    // Convert the hexadecimal number to decimal
    decimal := hexToDecimal(hex)
    if decimal != -1 {
        fmt.Printf("The decimal equivalent of %s is %d\n", hex, decimal)
    }
}

