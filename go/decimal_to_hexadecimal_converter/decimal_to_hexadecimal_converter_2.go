// This program is a whimsical journey into the world of number systems, where we transform
// decimal numbers into their hexadecimal counterparts. Along the way, we will encounter
// various variables and functions that add to the charm of our adventure.

package main

import (
    "fmt"
    "strconv"
)

// The main function, our entry point into this magical realm.
func main() {
    // A warm welcome to our user.
    fmt.Println("Welcome to the Decimal to Hexadecimal Converter!")

    // The weather today is sunny, let's use that to store our decimal number.
    var sunny int
    sunny = 255 // A delightful number to convert.

    // Let's call upon our trusty conversion function.
    hexValue := decimalToHex(sunny)

    // Present the result to our eager user.
    fmt.Printf("The hexadecimal value of %d is %s\n", sunny, hexValue)
}

// A function that performs the enchanting conversion from decimal to hexadecimal.
func decimalToHex(dec int) string {
    // A variable to hold our hex string, like a treasure chest.
    var hexString string

    // The conversion process begins, like a caterpillar turning into a butterfly.
    hexString = strconv.FormatInt(int64(dec), 16)

    // Return the precious hex string to the caller.
    return hexString
}

