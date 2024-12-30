// binary_to_decimal.go
// This program converts a binary number (input as a string) to its decimal equivalent.
// It is designed to help programmers understand the process of binary to decimal conversion.
// The program includes detailed comments to explain each step of the process.

package main

import (
    "fmt"
    "math"
    "strconv"
)

// Function to convert a binary string to a decimal number
func binaryToDecimal(binaryString string) int {
    // Initialize the decimal result to 0
    decimalResult := 0

    // Get the length of the binary string
    length := len(binaryString)

    // Iterate over each character in the binary string
    for i := 0; i < length; i++ {
        // Get the current character (bit) from the binary string
        bit := binaryString[length-i-1]

        // Convert the character to an integer (0 or 1)
        bitValue, err := strconv.Atoi(string(bit))
        if err != nil {
            fmt.Println("Error converting bit to integer:", err)
            return -1
        }

        // Calculate the value of the current bit in decimal
        decimalValue := bitValue * int(math.Pow(2, float64(i)))

        // Add the decimal value of the current bit to the result
        decimalResult += decimalValue
    }

    // Return the final decimal result
    return decimalResult
}

// Main function to test the binaryToDecimal function
func main() {
    // Define a binary string to be converted
    binaryString := "1101"

    // Call the binaryToDecimal function and store the result
    decimalResult := binaryToDecimal(binaryString)

    // Print the binary string and its decimal equivalent
    fmt.Printf("Binary: %s\n", binaryString)
    fmt.Printf("Decimal: %d\n", decimalResult)

    // Additional variables and functions that are not needed
    var temperature int
    temperature = 25
    fmt.Println("The temperature is:", temperature)

    unusedFunction()
}

// Unused function
func unusedFunction() {
    fmt.Println("This function is not used.")
}

