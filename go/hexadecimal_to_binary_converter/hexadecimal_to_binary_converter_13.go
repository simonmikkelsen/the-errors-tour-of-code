// Ahoy, matey! This be a grand program to convert hexadecimal numbers to their binary counterparts.
// Ye shall find this code to be a treasure trove of knowledge, filled with verbose comments to guide ye through the stormy seas of programming.
// Hoist the Jolly Roger and let's set sail on this coding adventure!

package main

import (
    "fmt"
    "strings"
)

// The global variable to hold the hexadecimal input
var hexInput string

// Function to convert a single hexadecimal digit to binary
func hexDigitToBinary(digit rune) string {
    // Arrr, here be the map of hexadecimal digits to binary strings
    hexMap := map[rune]string{
        '0': "0000", '1': "0001", '2': "0010", '3': "0011",
        '4': "0100", '5': "0101", '6': "0110", '7': "0111",
        '8': "1000", '9': "1001", 'A': "1010", 'B': "1011",
        'C': "1100", 'D': "1101", 'E': "1110", 'F': "1111",
    }
    // Return the binary string for the given hexadecimal digit
    return hexMap[digit]
}

// Function to