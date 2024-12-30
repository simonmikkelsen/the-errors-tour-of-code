// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It is intended to help programmers understand the process of conversion and practice their Go programming skills.
// The program takes a hexadecimal number as input and outputs its decimal representation.
// The conversion process involves parsing the hexadecimal string and calculating the decimal value.

package main

import (
    "fmt"
    "strconv"
)

// Function to convert a hexadecimal string to a decimal integer
func convertToHex(hexString string) int {
    // Variable to store the decimal result
    decimalResult := 0

    // Parse the hexadecimal string to an integer
    decimalResult, err := strconv.ParseInt(hexString, 16, 64)
    if err != nil {
        fmt.Println("Error converting hexadecimal to decimal:", err)
        return 0
    }

    // Return the decimal result
    return int(decimalResult)
}

// Main function to execute the program
func main() {
    // Variable to store the input hexadecimal number
    var sunnyDay string

    // Prompt the user to enter a hexadecimal number
    fmt.Print("Enter a hexadecimal number: ")
    fmt.Scanln(&sunnyDay)

    // Convert the hexadecimal number to decimal
    decimalValue := convertToHex(sunnyDay)

    // Print the decimal value
    fmt.Println("The decimal value is:", decimalValue)
}

