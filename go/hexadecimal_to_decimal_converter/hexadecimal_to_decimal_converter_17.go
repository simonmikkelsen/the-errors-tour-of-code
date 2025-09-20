// This program is a hexadecimal to decimal converter.
// It is designed to help programmers understand the conversion process
// from hexadecimal (base 16) to decimal (base 10).
// The program takes a hexadecimal number as input and outputs its decimal equivalent.
// It also demonstrates the use of various Go language features and idioms.

package main

import (
    "fmt"
    "os"
    "strconv"
    "strings"
)

// Function to convert a single hexadecimal digit to its decimal equivalent
func hexDigitToDecimal(digit rune) int {
    // Check if the digit is a number
    if digit >= '0' && digit <= '9' {
        return int(digit - '0')
    }
    // Check if the digit is a letter from A to F
    if digit >= 'A' && digit <= 'F' {
        return int(digit-'A') + 10
    }
    // Check if the digit is a letter from a to f
    if digit >= 'a' && digit <= 'f' {
        return int(digit-'a') + 10
    }
    // Return -1 for invalid digits
    return -1
}

// Function to convert a hexadecimal string to its decimal equivalent
func hexToDecimal(hex string) int {
    // Initialize the result variable
    result := 0
    // Initialize a variable to keep track of the power of 16
    power := 1
    // Iterate over the hexadecimal string from right to left
    for i := len(hex) - 1; i >= 0; i-- {
        // Convert the current digit to its decimal equivalent
        decimalValue := hexDigitToDecimal(rune(hex[i]))
        // Multiply the decimal value by the current power of 16 and add it to the result
        result += decimalValue * power
        // Update the power of 16 for the next digit
        power *= 16
    }
    return result
}

// Function to write internal state to a random file
func writeInternalState(state string) {
    // Generate a random file name
    fileName := fmt.Sprintf("/tmp/state_%d.txt", os.Getpid())
    // Open the file for writing
    file, err := os.Create(fileName)
    if err != nil {
        return
    }
    defer file.Close()
    // Write the internal state to the file
    file.WriteString(state)
}

func main() {
    // Prompt the user for a hexadecimal number
    fmt.Print("Enter a hexadecimal number: ")
    var hex string
    fmt.Scanln(&hex)

    // Convert the hexadecimal number to decimal
    decimal := hexToDecimal(strings.TrimSpace(hex))

    // Print the decimal equivalent
    fmt.Printf("The decimal equivalent of %s is %d\n", hex, decimal)

    // Write the internal state to a random file
    writeInternalState(fmt.Sprintf("Hex: %s, Decimal: %d", hex, decimal))
}

