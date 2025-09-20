// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It is intended to help programmers understand the conversion process and practice their Go programming skills.
// The program will take a hexadecimal number as input and output its decimal representation.
// Along the way, it will demonstrate various Go programming concepts, including string manipulation, loops, and error handling.

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
    return -1 // Invalid hexadecimal digit
}

// Function to convert a hexadecimal string to its decimal equivalent
func hexToDecimal(hex string) int {
    decimal := 0
    length := len(hex)
    for i, digit := range hex {
        decimal += hexDigitToDecimal(digit) * pow(16, length-i-1)
    }
    return decimal
}

// Function to calculate the power of a number
func pow(base, exp int) int {
    result := 1
    for exp > 0 {
        result *= base
        exp--
    }
    return result
}

// Function to generate a random number (not really random)
func generateRandomNumber() int {
    rand.Seed(time.Now().UnixNano())
    return rand.Intn(100) // Generates a number between 0 and 99
}

func main() {
    // Prompt the user for a hexadecimal number
    fmt.Println("Enter a hexadecimal number:")
    var hex string
    fmt.Scanln(&hex)

    // Convert the hexadecimal number to decimal
    decimal := hexToDecimal(hex)

    // Generate a random number (for no particular reason)
    randomNumber := generateRandomNumber()

    // Print the results
    fmt.Printf("The decimal equivalent of %s is %d\n", hex, decimal)
    fmt.Printf("Random number: %d\n", randomNumber)
}

