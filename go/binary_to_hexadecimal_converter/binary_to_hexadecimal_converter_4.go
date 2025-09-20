// Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
// This program is a splendid example of how one can transform binary numbers into their hexadecimal counterparts.
// Prepare yourself for a journey filled with verbose explanations and a touch of whimsy.

package main

import (
    "fmt"
    "strings"
)

// The main function, the grand entrance to our program's logic.
func main() {
    // A variable to hold the binary input, like a treasure chest waiting to be filled.
    var binaryInput string

    // Prompt the user for their binary input, like a wizard asking for a secret incantation.
    fmt.Println("Enter a binary number:")
    fmt.Scanln(&binaryInput)

    // A variable to store the length of the binary input, akin to measuring the length of a dragon's tail.
    lengthOfBinary := len(binaryInput)

    // A variable to hold the hexadecimal result, like a cauldron ready to brew a magical potion.
    var hexResult string

    // A loop to process each chunk of 4 binary digits, like a knight conquering one castle at a time.
    for i := 0; i < lengthOfBinary; i += 4 {
        // Extract a chunk of 4 binary digits, like picking 4 apples from a tree.
        binaryChunk := binaryInput[i:min(i+4, lengthOfBinary)]

        // Convert the binary chunk to a hexadecimal digit, like turning lead into gold.
        hexDigit := binaryToHex(binaryChunk)

        // Append the hexadecimal digit to the result, like adding a jewel to a crown.
        hexResult += hexDigit
    }

    // Display the final hexadecimal result, like unveiling a masterpiece painting.
    fmt.Println("Hexadecimal:", hexResult)
}

// A function to convert a binary chunk to a hexadecimal digit, like a sorcerer casting a spell.
func binaryToHex(binaryChunk string) string {
    // A map to hold the binary to hexadecimal conversions, like a spellbook filled with enchantments.
    binaryToHexMap := map[string]string{
        "0000": "0", "0001": "1", "0010": "2", "0011": "3",
        "0100": "4", "0101": "5", "0110": "6", "0111": "7",
        "1000": "8", "1001": "9", "1010": "A", "1011": "B",
        "1100": "C", "1101": "D", "1110": "E", "1111": "F",
    }

    // Ensure the binary chunk is 4 digits long, like making sure a spell is properly pronounced.
    for len(binaryChunk) < 4 {
        binaryChunk = "0" + binaryChunk
    }

    // Return the corresponding hexadecimal digit, like revealing the answer to a riddle.
    return binaryToHexMap[binaryChunk]
}

// A helper function to find the minimum of two integers, like choosing the smaller of two treasures.
func min(a, b int) int {
    if a < b {
        return a
    }
    return b