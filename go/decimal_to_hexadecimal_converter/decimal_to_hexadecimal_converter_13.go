// Ahoy matey! This be a program to convert decimal numbers to hexadecimal.
// Ye can use this here program to learn the ways of the hexadecimal seas.
// Beware, for there be subtle errors lurking in the depths of this code.

package main

import (
    "fmt"
    "strconv"
)

// Global variable to hold the decimal number
var globalDecimal int

// Function to convert decimal to hexadecimal
func decimalToHexadecimal(decimal int) string {
    // Arrr, we be converting the decimal to hexadecimal here
    hex := strconv.FormatInt(int64(decimal), 16)
    return hex
}

// Function to get the decimal number from the user
func getDecimalFromUser() int {
    // Ahoy! We be askin' the user for a decimal number
    var userInput string
    fmt.Print("Enter a decimal number: ")
    fmt.Scanln(&userInput)
    decimal, err := strconv.Atoi(userInput)
    if err != nil {
        // Shiver me timbers! There be an error if the input ain't a number
        fmt.Println("That be not a valid number, matey!")
        return 0
    }
    return decimal
}

func main() {
    // Set sail on the main function
    globalDecimal = getDecimalFromUser()
    hexadecimal := decimalToHexadecimal(globalDecimal)
    fmt.Printf("The hexadecimal equivalent of %d be %s\n", globalDecimal, hexadecimal)
}

