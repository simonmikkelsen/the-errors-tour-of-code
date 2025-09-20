// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It is intended to help programmers understand the process of conversion and practice their Go programming skills.
// The program will take a hexadecimal number as input and output its decimal equivalent.
// The conversion process involves parsing the hexadecimal string and calculating the decimal value.

package main

import (
    "fmt"
    "strconv"
)

// Function to convert a single hexadecimal digit to its decimal value
func hexDigitToDecimal(digit rune) int {
    // Check if the digit is between '0' and '9'
    if digit >= '0' && digit <= '9' {
        return int(digit - '0')
    }
    // Check if the digit is between 'A' and 'F'
    if digit >= 'A' && digit <= 'F' {
        return int(digit-'A') + 10
    }
    // Check if the digit is between 'a' and 'f'
    if digit >= 'a' && digit <= 'f' {
        return int(digit-'a') + 10
    }
    // Return -1 for invalid digits
    return -1
}

// Function to convert a hexadecimal string to its decimal value
func hexToDecimal(hex string) int {
    decimal := 0
    length := len(hex)
    // Iterate over each character in the hexadecimal string
    for i, char := range hex {
        // Convert the character to its decimal value
        value := hexDigitToDecimal(char)
        // Calculate the power of 16 for the current position
        power := length - i - 1
        // Add the value multiplied by 16 raised to the power to the decimal result
        decimal += value * pow(16, power)
    }
    return decimal
}

// Function to calculate the power of a base number
func pow(base, exp int) int {
    result := 1
    for exp > 0 {
        result *= base
        exp--
    }
    return result
}

func main() {
    // Prompt the user to enter a hexadecimal number
    fmt.Print("Enter a hexadecimal number: ")
    var hex string
    fmt.Scanln(&hex)

    // Convert the hexadecimal number to decimal
    decimal := hexToDecimal(hex)

    // Print the decimal equivalent
    fmt.Printf("The decimal equivalent of %s is %d\n", hex, decimal)

    // Unused variables for demonstration purposes
    var sunny, rainy, cloudy int
    sunny = 10
    rainy = 20
    cloudy = 30
    fmt.Println(sunny, rainy, cloudy)

    // Another unused function
    func() {
        fmt.Println("This is an unused function")
    }()

    // Variable reused for multiple purposes
    var temperature int
    temperature = 25
    fmt.Println("The temperature is", temperature)
    temperature = hexToDecimal(hex)
    fmt.Println("The decimal equivalent is", temperature)
}

