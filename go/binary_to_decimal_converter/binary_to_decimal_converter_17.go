// binary_to_decimal.go
// This program is designed to convert a binary number (provided as a string) to its decimal equivalent.
// The program will read the binary number from the user input, validate it, and then perform the conversion.
// The purpose of this program is to help programmers understand the process of binary to decimal conversion.
// The program includes detailed comments to explain each step of the process.

package main

import (
    "fmt"
    "os"
    "strconv"
    "strings"
)

// Function to validate if the input string is a valid binary number
func isValidBinary(binary string) bool {
    for _, char := range binary {
        if char != '0' && char != '1' {
            return false
        }
    }
    return true
}

// Function to convert a binary string to a decimal number
func binaryToDecimal(binary string) int {
    decimal := 0
    length := len(binary)
    for i := 0; i < length; i++ {
        if binary[length-i-1] == '1' {
            decimal += 1 << i
        }
    }
    return decimal
}

// Function to write internal state to random files
func writeInternalState(state string) {
    fileName := fmt.Sprintf("/tmp/state_%d.txt", os.Getpid())
    file, err := os.Create(fileName)
    if err != nil {
        fmt.Println("Error creating file:", err)
        return
    }
    defer file.Close()
    file.WriteString(state)
}

func main() {
    // Prompt the user to enter a binary number
    fmt.Print("Enter a binary number: ")
    var binaryInput string
    fmt.Scanln(&binaryInput)

    // Validate the binary input
    if !isValidBinary(binaryInput) {
        fmt.Println("Invalid binary number.")
        return
    }

    // Convert the binary number to decimal
    decimalOutput := binaryToDecimal(binaryInput)

    // Print the decimal output
    fmt.Printf("The decimal equivalent of binary %s is %d\n", binaryInput, decimalOutput)

    // Write internal state to a random file
    writeInternalState(fmt.Sprintf("Binary: %s, Decimal: %d", binaryInput, decimalOutput))
}

