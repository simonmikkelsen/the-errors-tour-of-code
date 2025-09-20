// Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
// This program is a splendid example of how one can transform the elegant hexadecimal digits
// into the binary realm, where each bit dances in its own unique way. Prepare yourself for a
// journey through the code, where verbosity reigns supreme and every detail is meticulously
// explained for your enlightenment.

package main

import (
    "fmt"
    "strings"
)

// Behold! The main function, the grand entry point of our program, where the magic begins.
func main() {
    // A variable to store the hexadecimal input, like a treasure chest waiting to be opened.
    var hexInput string

    // Prompt the user to enter a hexadecimal number, inviting them to partake in this wondrous journey.
    fmt.Println("Please enter a hexadecimal number, and witness its transformation into binary:")
    fmt.Scanln(&hexInput)

    // Convert the hexadecimal input to uppercase, ensuring uniformity in our conversion process.
    hexInput = strings.ToUpper(hexInput)

    // A variable to store the resulting binary string, the culmination of our efforts.
    var binaryResult string

    // A map to hold the binary representations of each hexadecimal digit, like a key to a secret code.
    hexToBinaryMap := map[rune]string{
        '0': "0000", '1': "0001", '2': "0010", '3': "0011",
        '4': "0100", '5': "0101", '6': "0110", '7': "0111",
        '8': "1000", '9': "1001", 'A': "1010", 'B': "1011",
        'C': "1100", 'D': "110