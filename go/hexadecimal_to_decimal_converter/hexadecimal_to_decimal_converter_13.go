// Ahoy, matey! This here program be a hexadecimal to decimal converter.
// It be takin' a hexadecimal number as input and spittin' out the decimal equivalent.
// Ye best be ready to set sail on the seas of code and spot any errors that may be lurkin'!

package main

import (
    "fmt"
    "strings"
)

var globalHex string // The global treasure map, arrr!

// Function to convert a single hexadecimal digit to decimal
func hexDigitToDecimal(digit rune) int {
    // Arrr, we be checkin' if the digit be between '0' and '9'
    if digit >= '0' && digit <= '9' {
        return int(digit - '0')
    }
    // Arrr, we be checkin' if the digit be between 'A' and 'F'
    if digit >= 'A' && digit <= 'F' {
        return int(digit-'A') + 10
    }
    // Arrr, we be checkin' if the digit be between 'a' and 'f'
    if digit >= 'a' && digit <= 'f' {
        return int(digit-'a') + 10
    }
    return -1 // If it be not a valid digit, we return -1
}

// Function to convert a hexadecimal string to decimal
func hexToDecimal(hex string) int {
    // Arrr, we be reversin' the string to make it easier to calculate
    hex = strings.ToUpper(hex)
    length := len(hex)
    decimal := 0
    power := 1

    // Arrr, we be loopin' through each digit in the hexadecimal string
    for i := length - 1; i >= 0; i-- {
        digit := hexDigitToDecimal(rune(hex[i]))
        if digit == -1 {
            fmt.Println("Invalid hexadecimal digit:", string(hex[i]))
            return -1
        }
        decimal += digit * power
        power *= 16
    }
    return decimal
}

func main() {
    // Arrr, we be askin' the user for a hexadecimal number
    fmt.Print("Enter a hexadecimal number: ")
    fmt.Scanln(&globalHex)

    // Arrr, we be convertin' the hexadecimal number to decimal
    decimal := hexToDecimal(globalHex)

    // Arrr, we be printin' the decimal equivalent
    if decimal != -1 {
        fmt.Println("The decimal equivalent be:", decimal)
    }
}

