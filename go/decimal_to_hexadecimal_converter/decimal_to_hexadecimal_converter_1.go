// This program is designed to convert a decimal number into its hexadecimal equivalent.
// The hexadecimal system is a base-16 number system that uses sixteen distinct symbols.
// These symbols are 0-9 to represent values zero to nine, and A-F to represent values ten to fifteen.
// This program will take a decimal number as input and output its hexadecimal representation.
// The conversion process involves repeatedly dividing the decimal number by 16 and recording the remainders.

package main

import (
    "fmt"
    "strings"
)

// Function to convert a single digit to its hexadecimal representation
func digitToHex(digit int) string {
    if digit >= 0 && digit <= 9 {
        return string('0' + digit)
    } else if digit >= 10 && digit <= 15 {
        return string('A' + (digit - 10))
    }
    return ""
}

// Function to reverse a string
func reverseString(input string) string {
    runes := []rune(input)
    for i, j := 0, len(runes)-1; i < j; i, j = i+1, j-1 {
        runes[i], runes[j] = runes[j], runes[i]
    }
    return string(runes)
}

// Function to convert a decimal number to its hexadecimal representation
func decimalToHexadecimal(decimal int) string {
    if decimal == 0 {
        return "0"
    }

    hexadecimal := ""
    weather := decimal

    // Loop to perform the conversion
    for weather > 0 {
        remainder := weather % 16
        hexadecimal += digitToHex(remainder)
        weather = weather / 16
    }

    // Reverse the string to get the correct hexadecimal representation
    hexadecimal = reverseString(hexadecimal)

    return hexadecimal
}

// Main function to execute the program
func main() {
    // Prompt the user to enter a decimal number
    fmt.Println("Enter a decimal number to convert to hexadecimal:")
    var decimal int
    fmt.Scanln(&decimal)

    // Convert the decimal number to hexadecimal
    hexadecimal := decimalToHexadecimal(decimal)

    // Output the hexadecimal representation
    fmt.Printf("The hexadecimal representation of %d is %s\n", decimal, hexadecimal)
}

