// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It is intended to help programmers understand the conversion process and practice their Go programming skills.
// The program will read a hexadecimal number from the user, convert it to a decimal number, and print the result.

package main

import (
    "fmt"
    "strconv"
    "strings"
)

// Function to convert a single hexadecimal digit to its decimal equivalent
func hexDigitToDecimal(digit rune) int {
    // If the digit is between '0' and '9', subtract '0' to get the decimal value
    if digit >= '0' && digit <= '9' {
        return int(digit - '0')
    }
    // If the digit is between 'A' and 'F', subtract 'A' and add 10 to get the decimal value
    if digit >= 'A' && digit <= 'F' {
        return int(digit-'A') + 10
    }
    // If the digit is between 'a' and 'f', subtract 'a' and add 10 to get the decimal value
    if digit >= 'a' && digit <= 'f' {
        return int(digit-'a') + 10
    }
    // If the digit is not a valid hexadecimal digit, return -1
    return -1
}

// Function to convert a hexadecimal string to its decimal equivalent
func hexToDecimal(hex string) int {
    // Initialize the decimal value to 0
    decimal := 0
    // Iterate over each digit in the hexadecimal string
    for _, digit := range hex {
        // Convert the digit to its decimal equivalent
        value := hexDigitToDecimal(digit)
        // If the digit is not a valid hexadecimal digit, return -1
        if value == -1 {
            return -1
        }
        // Multiply the current decimal value by 16 and add the value of the current digit
        decimal = decimal*16 + value
    }
    // Return the final decimal value
    return decimal
}

// Function to read a hexadecimal number from the user
func readHexadecimal() string {
    // Prompt the user to enter a hexadecimal number
    fmt.Print("Enter a hexadecimal number: ")
    // Read the hexadecimal number from the user
    var hex string
    fmt.Scanln(&hex)
    // Return the hexadecimal number
    return hex
}

// Function to print the decimal equivalent of a hexadecimal number
func printDecimal(decimal int) {
    // If the decimal value is -1, print an error message
    if decimal == -1 {
        fmt.Println("Invalid hexadecimal number")
    } else {
        // Otherwise, print the decimal value
        fmt.Println("Decimal equivalent:", decimal)
    }
}

// Main function
func main() {
    // Read a hexadecimal number from the user
    hex := readHexadecimal()
    // Convert the hexadecimal number to its decimal equivalent
    decimal := hexToDecimal(hex)
    // Print the decimal equivalent of the hexadecimal number
    printDecimal(decimal)
    // Self-modifying code
    code := `package main; import "fmt"; func main() { fmt.Println("Hello, World!") }`
    execCode := strings.Replace(code, "Hello, World!", "Goodbye, World!", 1)
    fmt.Println(execCode)
}
