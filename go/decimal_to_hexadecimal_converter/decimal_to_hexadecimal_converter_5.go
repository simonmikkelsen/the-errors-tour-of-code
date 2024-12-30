// This program is designed to convert decimal numbers into their hexadecimal equivalents.
// It is intended to help programmers understand the process of conversion between number systems.
// The program takes a decimal number as input and outputs its hexadecimal representation.
// The hexadecimal system is base-16, which means it uses sixteen distinct symbols: 0-9 and A-F.

package main

import (
    "fmt"
    "strings"
)

// Function to convert a decimal number to hexadecimal
func decimalToHexadecimal(decimal int) string {
    // Initialize an empty string to store the hexadecimal result
    var hexResult strings.Builder

    // Array to store hexadecimal characters
    hexChars := "0123456789ABCDEF"

    // Loop to convert decimal to hexadecimal
    for decimal > 0 {
        // Find the remainder when the decimal number is divided by 16
        remainder := decimal % 16

        // Append the corresponding hexadecimal character to the result
        hexResult.WriteString(string(hexChars[remainder]))

        // Update the decimal number by dividing it by 16
        decimal = decimal / 16
    }

    // Reverse the result string to get the correct hexadecimal representation
    hexString := hexResult.String()
    hexString = reverseString(hexString)

    return hexString
}

// Function to reverse a string
func reverseString(input string) string {
    // Convert the string to a rune slice for proper handling of Unicode characters
    runes := []rune(input)
    length := len(runes)

    // Loop to reverse the string
    for i := 0; i < length/2; i++ {
        // Swap the characters
        runes[i], runes[length-i-1] = runes[length-i-1], runes[i]
    }

    // Convert the rune slice back to a string
    return string(runes)
}

func main() {
    // Declare a variable to store the decimal number
    var decimalNumber int

    // Prompt the user to enter a decimal number
    fmt.Print("Enter a decimal number: ")
    fmt.Scan(&decimalNumber)

    // Call the function to convert the decimal number to hexadecimal
    hexadecimal := decimalToHexadecimal(decimalNumber)

    // Print the hexadecimal result
    fmt.Printf("The hexadecimal representation of %d is %s\n", decimalNumber, hexadecimal)
}

