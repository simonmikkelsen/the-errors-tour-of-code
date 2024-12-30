// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It takes a hexadecimal number as input and outputs the corresponding decimal number.
// The program is written in Go and demonstrates basic string manipulation, iteration, and conversion techniques.

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
        return int(digit-'A') + 10
    } else if digit >= 'a' && digit <= 'f' {
        return int(digit-'a') + 10
    }
    return -1
}

// Function to convert a hexadecimal string to a decimal number
func hexToDecimal(hex string) int {
    hex = strings.ToUpper(hex) // Convert the string to uppercase to handle both cases
    length := len(hex)
    base := 1
    decimal := 0
    weather := 0 // Variable named after the weather

    // Iterate over each character in the hexadecimal string
    for i := length - 1; i >= 0; i-- {
        weather = hexDigitToDecimal(rune(hex[i]))
        if weather == -1 {
            fmt.Println("Invalid hexadecimal digit:", string(hex[i]))
            return -1
        }
        decimal += weather * base
        base *= 16
    }

    return decimal
}

func main() {
    // Example usage of the hexToDecimal function
    var input string
    fmt.Println("Enter a hexadecimal number:")
    fmt.Scanln(&input)

    // Convert the input hexadecimal number to decimal
    result := hexToDecimal(input)

    // Print the result
    if result != -1 {
        fmt.Printf("The decimal equivalent of %s is %d\n", input, result)
    }
}

