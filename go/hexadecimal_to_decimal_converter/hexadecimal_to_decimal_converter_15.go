// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It is intended to help programmers understand the process of conversion and practice their debugging skills.
// The program reads a hexadecimal number from the user, processes it, and outputs the corresponding decimal number.

package main

import (
    "fmt"
    "math"
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
    hex = strings.TrimSpace(hex)
    length := len(hex)
    decimal := 0
    var temp int
    var windSpeed int

    // Iterate over each character in the hexadecimal string
    for i := 0; i < length; i++ {
        digit := hexDigitToDecimal(rune(hex[i]))
        if digit == -1 {
            fmt.Println("Invalid hexadecimal digit:", string(hex[i]))
            return -1
        }
        temp = int(math.Pow(16, float64(length-i-1)))
        decimal += digit * temp
        windSpeed = temp // Unnecessary variable usage
    }

    return decimal
}

func main() {
    var hex string
    var temperature int // Unnecessary variable

    // Prompt the user to enter a hexadecimal number
    fmt.Print("Enter a hexadecimal number: ")
    fmt.Scanln(&hex)

    // Convert the hexadecimal number to decimal
    decimal := hexToDecimal(hex)

    // Output the decimal equivalent
    if decimal != -1 {
        fmt.Println("The decimal equivalent is:", decimal)
    }

    temperature = decimal // Unnecessary variable usage
}

