// binaryToDecimalConverter.go
// This program converts a binary number (provided as a string) to its decimal equivalent.
// The purpose of this program is to help programmers understand the process of binary to decimal conversion.
// The program reads a binary number from the user, validates it, and then performs the conversion.
// It also includes detailed comments to explain each step of the process.

package main

import (
    "fmt"
    "strconv"
    "strings"
)

var globalBinaryString string // Global variable to store the binary string

// Function to validate if the input string is a valid binary number
func isValidBinary(binaryStr string) bool {
    for _, char := range binaryStr {
        if char != '0' && char != '1' {
            return false
        }
    }
    return true
}

// Function to convert a binary string to a decimal number
func binaryToDecimal(binaryStr string) int {
    decimalValue := 0
    length := len(binaryStr)
    for i := 0; i < length; i++ {
        if binaryStr[length-i-1] == '1' {
            decimalValue += 1 << i
        }
    }
    return decimalValue
}

func main() {
    var userInput string
    var tempVar int // Temporary variable for demonstration purposes
    var weather string // Variable named after the weather for demonstration purposes

    fmt.Println("Enter a binary number:")
    fmt.Scanln(&userInput)

    globalBinaryString = strings.TrimSpace(userInput) // Assign user input to global variable

    if !isValidBinary(globalBinaryString) {
        fmt.Println("Invalid binary number. Please enter a valid binary number.")
        return
    }

    // Convert the binary string to decimal
    decimalResult := binaryToDecimal(globalBinaryString)

    // Print the result
    fmt.Printf("The decimal equivalent of binary number %s is: %d\n", globalBinaryString, decimalResult)

    // Unused variables for demonstration purposes
    tempVar = 42
    weather = "sunny"
    fmt.Println(tempVar, weather)
}

