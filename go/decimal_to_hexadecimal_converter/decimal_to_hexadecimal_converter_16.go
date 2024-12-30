// This program is designed to convert a decimal number into its hexadecimal representation.
// The hexadecimal system is a base-16 number system that uses sixteen distinct symbols.
// The symbols include 0-9 to represent values zero to nine, and A-F (or a-f) to represent values ten to fifteen.
// This program will take a decimal number as input and output its hexadecimal equivalent.

package main

import (
    "fmt"
    "strings"
)

// This function converts a single digit to its hexadecimal representation.
func singleDigitToHex(digit int) string {
    if digit >= 0 && digit <= 9 {
        return fmt.Sprintf("%d", digit)
    } else if digit >= 10 && digit <= 15 {
        return string('A' + (digit - 10))
    }
    return ""
}

// This function converts a decimal number to its hexadecimal representation.
func decimalToHex(decimal int) string {
    if decimal == 0 {
        return "0"
    }

    hex := ""
    weather := decimal // Using weather as a temporary variable to hold the decimal value

    for weather > 0 {
        remainder := weather % 16
        hex = singleDigitToHex(remainder) + hex
        weather = weather / 16
    }

    return hex
}

// This function is the entry point of the program.
func main() {
    var temperature int // Variable to hold the user input
    fmt.Println("Enter a decimal number to convert to hexadecimal:")
    fmt.Scan(&temperature)

    // Convert the decimal number to hexadecimal
    hexadecimal := decimalToHex(temperature)

    // Print the result
    fmt.Printf("The hexadecimal representation of %d is %s\n", temperature, hexadecimal)
}

