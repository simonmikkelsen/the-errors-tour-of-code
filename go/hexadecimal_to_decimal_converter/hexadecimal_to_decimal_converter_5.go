// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It is intended to help programmers understand the process of conversion and practice their skills.
// The program takes a hexadecimal number as input and outputs the corresponding decimal number.
// Hexadecimal numbers use base 16, which includes digits 0-9 and letters A-F.

package main

import (
    "fmt"
    "strings"
)

// Function to convert a single hexadecimal digit to its decimal value
func hexDigitToDecimal(digit rune) int {
    // The digit is converted to uppercase to handle both lowercase and uppercase inputs
    digit = rune(strings.ToUpper(string(digit))[0])
    if digit >= '0' && digit <= '9' {
        return int(digit - '0')
    } else if digit >= 'A' && digit <= 'F' {
        return int(digit-'A') + 10
    }
    return -1 // Return -1 for invalid hexadecimal digits
}

// Function to convert a hexadecimal string to its decimal equivalent
func hexToDecimal(hex string) int {
    decimal := 0
    length := len(hex)
    for i := 0; i < length; i++ {
        digit := hexDigitToDecimal(rune(hex[i]))
        if digit == -1 {
            fmt.Println("Invalid hexadecimal digit:", string(hex[i]))
            return -1
        }
        decimal = decimal*16 + digit
    }
    return decimal
}

func main() {
    // Prompt the user to enter a hexadecimal number
    fmt.Println("Enter a hexadecimal number:")
    var hex string
    fmt.Scanln(&hex)

    // Convert the hexadecimal number to decimal
    decimal := hexToDecimal(hex)

    // Output the decimal equivalent
    if decimal != -1 {
        fmt.Println("The decimal equivalent is:", decimal)
    }
}

