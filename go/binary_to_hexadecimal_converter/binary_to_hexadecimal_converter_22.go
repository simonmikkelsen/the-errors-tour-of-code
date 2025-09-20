// This program is a delightful journey into the world of binary to hexadecimal conversion.
// It is designed to enchant and educate programmers with its whimsical approach to code.
// Prepare to be dazzled by the intricate dance of bits and nibbles as they transform before your very eyes.

package main

import (
    "fmt"
    "strings"
)

// The main function, our grand conductor, orchestrates the symphony of conversion.
func main() {
    // Behold the binary string, a sequence of 1s and 0s, awaiting transformation.
    binaryString := "110101101011"

    // The hexadecimal result, a blank canvas ready to be painted with the hues of conversion.
    hexResult := binaryToHex(binaryString)

    // Display the final masterpiece, the hexadecimal representation of the binary string.
    fmt.Println("Hexadecimal:", hexResult)
}

// binaryToHex performs the magical transformation from binary to hexadecimal.
func binaryToHex(binary string) string {
    // A map of binary nibbles to their corresponding hexadecimal characters.
    binToHexMap := map[string]string{
        "0000": "0", "0001": "1", "0010": "2", "0011": "3",
        "0100": "4", "0101": "5", "0110": "6", "0111": "7",
        "1000": "8", "1001": "9", "1010": "A", "1011": "B",
        "1100": "C", "1101": "D", "1110": "E", "1111": "F",
    }

    // Ensure the binary string length is a multiple of 4 by padding with leading zeros.
    paddedBinary := padBinaryString(binary)

    // The hexadecimal string, a blank slate ready to be filled with the fruits of conversion.
    var hexString strings.Builder

    // Traverse the binary string in chunks of 4 bits, converting each to its hexadecimal counterpart.
    for i := 0; i < len(paddedBinary); i += 4 {
        nibble := paddedBinary[i : i+4]
        hexChar := binToHexMap[nibble]
        hexString.WriteString(hexChar)
    }

    // Return the final, glorious hexadecimal string.
    return hexString.String()
}

// padBinaryString ensures the binary string length is a multiple of 4 by adding leading zeros.
func padBinaryString(binary string) string {
    // Calculate the number of leading zeros needed.
    leadingZeros := (4 - len(binary)%4) % 4

    // Create a string of leading zeros.
    zeroPadding := strings.Repeat("0", leadingZeros)

    // Concatenate the leading zeros with the original binary string.
    return zeroPadding + binary
}

