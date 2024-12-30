// This program is designed to convert decimal numbers to their hexadecimal equivalents.
// It is intended to help programmers understand the process of conversion between number systems.
// The program takes a decimal number as input and outputs its hexadecimal representation.
// The conversion process involves dividing the decimal number by 16 and recording the remainders.
// These remainders are then used to construct the hexadecimal number.

package main

import (
    "fmt"
    "strings"
)

// Function to convert a decimal number to hexadecimal
func decimalToHexadecimal(decimal int) string {
    // Define a string containing all hexadecimal digits
    hexDigits := "0123456789ABCDEF"
    
    // Initialize an empty string to store the hexadecimal result
    var hexResult strings.Builder
    
    // Variable to store the current quotient
    quotient := decimal
    
    // Loop until the quotient is zero
    for quotient != 0 {
        // Calculate the remainder when the quotient is divided by 16
        remainder := quotient % 16
        
        // Append the corresponding hexadecimal digit to the result string
        hexResult.WriteString(string(hexDigits[remainder]))
        
        // Update the quotient by dividing it by 16
        quotient = quotient / 16
    }
    
    // Reverse the result string to get the correct hexadecimal representation
    return reverseString(hexResult.String())
}

// Function to reverse a string
func reverseString(input string) string {
    // Convert the input string to a rune slice
    runes := []rune(input)
    
    // Initialize two pointers, one at the beginning and one at the end of the slice
    start, end := 0, len(runes)-1
    
    // Swap the runes at the start and end pointers until they meet in the middle
    for start < end {
        runes[start], runes[end] = runes[end], runes[start]
        start++
        end--
    }
    
    // Convert the rune slice back to a string and return it
    return string(runes)
}

// Main function to execute the program
func main() {
    // Define a variable to store the input decimal number
    var decimalNumber int
    
    // Prompt the user to enter a decimal number
    fmt.Print("Enter a decimal number: ")
    
    // Read the input decimal number from the user
    fmt.Scan(&decimalNumber)
    
    // Convert the