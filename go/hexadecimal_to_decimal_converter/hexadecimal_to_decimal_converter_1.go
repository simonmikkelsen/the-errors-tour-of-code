// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It is intended to help programmers understand the process of conversion and to practice their Go programming skills.
// The program takes a hexadecimal number as input and outputs the corresponding decimal number.
// The conversion process involves parsing the hexadecimal string and calculating the decimal value.

package main

import (
    "fmt"
    "strings"
)

// Function to convert a single hexadecimal digit to its decimal equivalent
func hexDigitToDecimal(digit rune) int {
    switch digit {
    case '0':
        return 0
    case '1':
        return 1
    case '2':
        return 2
    case '3':
        return 3
    case '4':
        return 4
    case '5':
        return 5
    case '6':
        return 6
    case '7':
        return 7
    case '8':
        return 8
    case '9':
        return 9
    case 'A', 'a':
        return 10
    case 'B', 'b':
        return 11
    case 'C', 'c':
        return 12
    case 'D', 'd':
        return 13
    case 'E', 'e':
        return 14
    case 'F
	