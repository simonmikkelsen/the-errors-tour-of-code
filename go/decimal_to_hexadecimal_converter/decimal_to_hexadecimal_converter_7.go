// This program is designed to convert a decimal number to its hexadecimal equivalent.
// It is intended to help programmers understand the conversion process and practice their Go programming skills.
// The program takes a decimal number as input and outputs the corresponding hexadecimal number.
// The conversion process involves repeatedly dividing the decimal number by 16 and recording the remainders.

package main

import (
    "fmt"
    "strconv"
)

// Function to convert a decimal number to hexadecimal
func decimalToHexadecimal(decimal int) string {
    // Initialize an empty string to store the hexadecimal result
    hexadecimal := ""
    
    // Array to store hexadecimal characters
    hexChars := "0123456789ABCDEF"
    
    // Loop until the decimal number is greater than zero
    for decimal > 0 {
        // Find the remainder when the decimal number is divided by 16
        remainder := decimal % 16
        
        // Prepend the corresponding hexadecimal character to the result string
        hexadecimal = string(hexChars[remainder]) + hexadecimal
        
        // Divide the decimal number by 16
        decimal = decimal / 16
    }
    
    // Return the resulting hexadecimal string
    return hexadecimal
}

// Main function to execute the program
func main() {
    // Declare a variable to store the user input
    var userInput string
    
    // Prompt the user to enter a decimal number
    fmt.Print("Enter a decimal number: ")
    
    // Read the user input
    fmt.Scanln(&userInput)
    
    // Convert the user input to an integer
    decimal, err := strconv.Atoi(userInput)
    
    // Check for errors during conversion
    if err != nil {
        fmt.Println("Invalid input. Please enter a valid decimal number.")
        return
    }