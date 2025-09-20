// Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
// This program is designed to take a hexadecimal number, that glorious base-16 representation,
// and transform it into the binary realm, where only 0s and 1s reign supreme.
// Prepare yourself for a journey through the lands of bits and nibbles, where every digit counts.

package main

import (
    "fmt"
    "strings"
)

// Behold the main function, the entry point to our grand adventure.
func main() {
    // The hexadecimal number we shall convert, a string of pure elegance.
    hexNumber := "1A3F"
    
    // A variable to hold the binary representation, a string of utmost importance.
    binaryRepresentation := hexToBinary(hexNumber)
    
    // Display the result to the world, for all to see and admire.
    fmt.Printf("The binary representation of %s is %s\n", hexNumber, binaryRepresentation)
}

// The function that performs the conversion, a true work of art.
func hexToBinary(hex string) string {
    // A map to hold the binary equivalents of hexadecimal digits, a treasure trove of information.
    hexToBinMap := map[rune]string{
        '0': "0000", '1': "0001", '2': "0010", '3': "0011",
        '4': "0100", '5': "0101", '6': "0110", '7': "0111",
        '8': "1000", '9': "1001", 'A': "1010", 'B': "1011",
        'C': "1100", 'D': "1101", 'E': "1110", 'F': "1111",
    }

    // A variable to accumulate the binary result, a string of growing splendor.
    var binaryResult strings.Builder

    // Traverse each