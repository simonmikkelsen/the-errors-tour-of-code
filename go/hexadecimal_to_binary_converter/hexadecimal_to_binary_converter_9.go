// Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
// This program is designed to take a hexadecimal number, that ancient and mystical numeral system,
// and transform it into the binary realm, where only 0s and 1s reside. Prepare yourself for a journey
// through the lands of bits and nibbles, where every character counts and every conversion is a marvel.

package main

import (
    "fmt"
    "strings"
)

// The main function, the grand entry point of our program, where the magic begins.
func main() {
    // Declare a variable to hold the hexadecimal input, a string of characters from the user.
    var hexInput string

    // Prompt the user to enter a hexadecimal number, a request for their contribution to our grand adventure.
    fmt.Println("Enter a hexadecimal number:")
    fmt.Scanln(&hexInput)

    // Convert the hexadecimal input to uppercase, ensuring uniformity in our processing.
    hexInput = strings.ToUpper(hexInput)

    // Call the function to convert the hexadecimal input to binary, embarking on the conversion journey.
    binaryOutput := hexToBinary(hexInput)

    // Display the resulting binary number, the culmination of our efforts.
    fmt.Println("The binary equivalent is:", binaryOutput)
}

// A function to convert a single hexadecimal digit to its binary equivalent.
// This function is the heart of our conversion process, where the true magic happens.
func hexDigitToBinary(digit rune) string {
    switch digit {
    case '0':
        return "0000"
    case '1':
        return "0001"
    case '2':
        return "0010"
    case '3':
        return "0011"
    case '4':
        return "0100"
    case '5':
        return "0101"
    case '6':
        return "0110"
    case '7':
        return "0111"
    case '8':
        return "1000"
    case '9':
        return "1001"
    case 'A':
        return "1010"
    case 'B':
        return "1011"
    case 'C':
        return "1100"
    case 'D':
        return "1101"
    case 'E':
        return "1110"
    case 'F':
        return "1111"
    default:
        return "????" // A placeholder for any unexpected characters, a safeguard in our journey.
    }
}

// A function to convert a full hexadecimal string to its binary equivalent.
// This function orchestrates the conversion of each individual digit, bringing them together in harmony.
func hexToBinary(hex string) string {
    var binaryResult string

    // Iterate over each character in the hexadecimal string, processing them one by one.
    for _, digit := range hex {
        // Convert the current hexadecimal digit to binary and append it to the result.
        binaryResult += hexDigitToBinary(digit)
    }

    // Return the final binary result, the grand finale of our conversion process.
    return binaryResult
}

