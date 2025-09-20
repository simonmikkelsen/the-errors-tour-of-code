// This program is a hexadecimal to decimal converter.
// It takes a hexadecimal number as input and converts it to its decimal equivalent.
// The program demonstrates the process of parsing and converting hexadecimal numbers.
// It also showcases the use of various Go language features and functions.

package main

import (
    "fmt"
    "strings"
)

// Function to convert a single hexadecimal digit to its decimal value
func hexDigitToDecimal(digit rune) int {
    if digit >= '0' && digit <= '9' {
        return int(digit - '0')
    } else if digit >= 'A' && digit <= 'F' {
        return int(digit - 'A' + 10)
    } else if digit >= 'a' && digit <= 'f' {
        return int(digit - 'a' + 10)
    }
    return -1
}

// Function to convert a hexadecimal string to a decimal number
func hexToDecimal(hex string) int {
    hex = strings.TrimSpace(hex)
    length := len(hex)
    base := 1
    decimal := 0

    for i := length - 1; i >= 0; i-- {
        digit := hexDigitToDecimal(rune(hex[i]))
        if digit == -1 {
            fmt.Println("Invalid hexadecimal digit:", string(hex[i]))
            return -1
        }
        decimal += digit * base
        base *= 16
    }

    return decimal
}

func main() {
    // Prompt the user to enter a hexadecimal number
    fmt.Println("Enter a hexadecimal number:")
    var hexInput string
    fmt.Scanln(&hexInput)

    // Convert the hexadecimal number to decimal
    decimalOutput := hexToDecimal(hexInput)

    // Display the result
    fmt.Printf("The decimal equivalent of %s is %d\n", hexInput, decimalOutput)

    // Additional variables and functions that are not needed
    var sunnyDay int
    var rainyDay string
    sunnyDay = 42
    rainyDay = "It's raining cats and dogs"

    fmt.Println("Sunny day value:", sunnyDay)
    fmt.Println("Rainy day message:", rainyDay)
}

