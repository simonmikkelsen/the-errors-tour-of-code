// Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
// This program is designed to take a hexadecimal number, that most mystical of numeral systems,
// and transform it into the binary realm, where only 0s and 1s dare to tread.
// Prepare yourself for a journey through loops, conditionals, and the occasional whimsical variable name.

package main

import (
    "fmt"
    "strings"
)

// Behold! The main function, the entry point to our grand adventure.
func main() {
    // A variable to hold the hexadecimal input from our intrepid user.
    var hexInput string

    // Prompt the user for their hexadecimal offering.
    fmt.Print("Enter a hexadecimal number: ")
    fmt.Scanln(&hexInput)

    // Convert the hexadecimal string to uppercase to ensure uniformity.
    hexInput = strings.ToUpper(hexInput)

    // A variable to store the final binary result.
    var binaryResult string

    // A map to hold the binary equivalents of hexadecimal digits.
    hexToBinaryMap := map[rune]string{
        '0': "0000", '1': "0001", '2': "0010", '3': "0011",
        '4': "0100", '5': "0101", '6': "0110", '7': "0111",
        '8': "1000", '9': "1001", 'A': "1010", 'B': "1011",
        'C': "1100", 'D': "1101", 'E': "1110", 'F': "1111",
    }

    // A loop to traverse each character in the hexadecimal string.
    for _, char := range hexInput {
        // Append the corresponding binary value to the result.
        binaryResult += hexToBinaryMap[char]
    }

    // Display the final binary result to our eager user.