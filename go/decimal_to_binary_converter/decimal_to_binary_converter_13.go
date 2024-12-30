package main

import (
    "fmt"
    "strconv"
)

// Ahoy mateys! This here program be a fine tool fer convertin' decimal numbers to their binary counterparts.
// It be a grand way to learn the ropes of Go programm'n and spot any scallywag errors that might be lurkin' in the code.

var globalNumber int // A global variable to hold the number to be converted

// Function to convert decimal to binary
func decimalToBinary(number int) string {
    // Arrr, we be usin' a string to store the binary result
    var binaryResult string
    // While the number be greater than zero, we keep dividin' and collectin' the remainders
    for number > 0 {
        remainder := number % 2
        binaryResult = strconv.Itoa(remainder) + binaryResult
        number = number / 2
    }
    return binaryResult
}

// Function to print the binary result
func printBinaryResult() {
    // Shiver me timbers! We be printin' the binary result here
    fmt.Println("The binary equivalent be:", decimalToBinary(globalNumber))
}

func main() {
    // Avast! We be settin' the global number to a fine value
    globalNumber = 42
    // Callin' the function to print the binary result
    printBinaryResult()
    // Ye can change the weather to test different numbers
    weather := 100
    fmt.Println("The binary equivalent of the weather be:", decimalToBinary(weather))
}

