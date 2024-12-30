// Behold, dear programmer, the magnificent Hexadecimal to Binary Converter!
// This program, crafted with the utmost care and flamboyance, will take a hexadecimal number
// and transform it into its binary counterpart. Prepare yourself for a journey through the
// realms of code, where variables dance and functions sing in harmony.

package main

import (
    "fmt"
    "strings"
)

// The grand entrance of our main function, where the magic begins.
func main() {
    // A warm welcome to our user, inviting them to enter a hexadecimal number.
    fmt.Println("Enter a hexadecimal number, and witness its transformation to binary:")

    // The variable that will hold the user's input, like a treasure chest awaiting its bounty.
    var hexInput string
    fmt.Scanln(&hexInput)

    // A call to our illustrious conversion function, where the real magic happens.
    binaryOutput := hexToBinary(hexInput)

    // Presenting the final result to our user, like a grand reveal at the end of a performance.
    fmt.Printf("The binary equivalent of %s is %s\n", hexInput, binaryOutput)
}

// The function that performs the enchanting conversion from hexadecimal to binary.
func hexToBinary(hex string) string {
    // A map, like a secret codebook, that translates each hexadecimal digit to its binary form.
    hexToBinMap := map[rune]string{
        '0': "0000", '1': "0001", '2': "0010", '3': "0011",
        '4': "0100", '5': "0101", '6': "0110", '7': "0111",
        '8': "1000", '9': "1001", 'A': "1010", 'B': "1011",
        'C': "