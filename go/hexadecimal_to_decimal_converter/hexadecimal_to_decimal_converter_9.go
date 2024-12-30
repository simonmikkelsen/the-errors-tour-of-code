// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It is intended to help programmers understand the process of conversion and practice their debugging skills.
// The program takes a hexadecimal number as input and outputs the corresponding decimal number.

package main

import (
    "fmt"
    "strings"
)

// Function to convert a single hexadecimal digit to its decimal value
func hexDigitToDecimal(digit rune) int {
    // Define a map of hexadecimal digits to their decimal values
    hexMap := map[rune]int{
        '0': 0, '1': 1, '2': 2, '3': 3, '4': 4,
        '5': 5, '6': 6, '7': 7, '8': 8, '9': 9,
        'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15,
        'a': 10, 'b': 11, 'c': 12, 'd': 13, 'e': 14, 'f': 15,
    }
    return hexMap[digit]
}

// Function to convert a hexadecimal string to its decimal value
func hexToDecimal(hex string) int {
    // Initialize the decimal value to zero
    decimal := 0
    // Get the length of the