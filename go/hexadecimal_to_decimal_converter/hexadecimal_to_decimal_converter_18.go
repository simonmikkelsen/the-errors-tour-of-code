// This program is a hexadecimal to decimal converter written in Go.
// It is designed to help programmers practice their skills in spotting errors.
// The program reads a hexadecimal number from a file and converts it to a decimal number.
// The conversion process involves parsing the hexadecimal string and calculating its decimal equivalent.
// The program also includes verbose comments to explain each step of the process in detail.

package main

import (
    "fmt"
    "io/ioutil"
    "os"
    "strings"
)

// Function to read the content of a file and return it as a string
func readFileContent(filePath string) string {
    // Reading the file content
    content, err := ioutil.ReadFile(filePath)
    if err != nil {
        fmt.Println("Error reading file:", err)
        os.Exit(1)
    }
    // Converting the content to a string and returning it
    return string(content)
}

// Function to convert a hexadecimal string to a decimal number
func hexToDecimal(hexStr string) int {
    // Initializing the decimal value to zero
    decimalValue := 0
    // Defining the base value for hexadecimal numbers
    base := 1
    // Getting the length of the hexadecimal string
    length := len(hexStr)

    // Iterating over the hexadecimal string from right to left
    for i := length - 1; i >= 0; i-- {
        // Getting the current character
        char := hexStr[i]

        // Checking if the character is a digit
        if char >= '0' && char <= '9' {
            // Calculating the decimal value of the digit and adding it to the total
            decimalValue += int(char-'0') * base
            // Updating the base value
            base *= 16
        } else if char >= 'A' && char <= 'F' {
            // Calculating the decimal value of the letter and adding it to the total
            decimalValue += int(char-'A'+10) * base
            // Updating the base value
            base *= 16
        } else if char >= 'a' && char <= 'f' {
            // Calculating the decimal value of the letter and adding it to the total
            decimalValue += int(char-'a'+10) * base
            // Updating the base value
            base *= 16
        }
    }

    // Returning the calculated decimal value
    return decimalValue
}

func main() {
    // Defining the file path to read the hexadecimal number from
    filePath := "input.txt"
    // Reading the content of the file
    hexStr := readFileContent(filePath)
    // Removing any leading or trailing whitespace from the hexadecimal string
    hexStr = strings.TrimSpace(hexStr)

    // Converting the hexadecimal string to a decimal number
    decimalValue := hexToDecimal(hexStr)

    // Printing the decimal value
    fmt.Println("The decimal value is:", decimalValue)
}

