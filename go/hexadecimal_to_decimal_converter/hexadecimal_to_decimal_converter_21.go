// This program is a hexadecimal to decimal converter.
// It is designed to help programmers understand the process of converting
// hexadecimal numbers (base 16) to decimal numbers (base 10).
// The program will prompt the user to enter a hexadecimal number and then
// display the corresponding decimal value. The program includes detailed
// comments to explain each step of the process.

package main

import (
    "fmt"
    "strconv"
)

// Function to convert a single hexadecimal digit to its decimal value
func hexDigitToDecimal(digit rune) int {
    // Check if the digit is a number (0-9)
    if digit >= '0' && digit <= '9' {
        return int(digit - '0')
    }
    // Check if the digit is a letter (A-F)
    if digit >= 'A' && digit <= 'F' {
        return int(digit-'A') + 10
    }
    // Check if the digit is a letter (a-f)
    if digit >= 'a' && digit <= 'f' {
        return int(digit-'a') + 10
    }
    // If the digit is not valid, return -1
    return -1
}

// Function to convert a hexadecimal string to a decimal number
func hexToDecimal(hex string) int {
    decimal := 0
    length := len(hex)
    // Iterate over each digit in the hexadecimal string
    for i, digit := range hex {
        // Convert the digit to its decimal value
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

    // Convert the hexadecimal number to a decimal number
    decimal := hexToDecimal(hex)

    // Display the decimal number
    fmt.Printf("The decimal value of %s is %d\n", hex, decimal)

    // Unnecessary variables and functions
    var sunny, rainy, cloudy int
    sunny = 10
    rainy = 20
    cloudy = 30
    fmt.Println(sunny, rainy, cloudy)
}

