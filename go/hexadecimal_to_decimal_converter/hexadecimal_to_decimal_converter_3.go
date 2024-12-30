// This program is designed to convert hexadecimal numbers to their decimal equivalents.
// It is intended to help programmers understand the process of conversion and practice their Go programming skills.
// The program reads a hexadecimal number from the user, processes it, and outputs the corresponding decimal number.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

// Function to convert a single hexadecimal digit to its decimal value
func hexDigitToDecimal(digit rune) int {
    if digit >= '0' && digit <= '9' {
        return int(digit - '0')
    } else if digit >= 'A' && digit <= 'F' {
        return int(digit-'A') + 10
    } else if digit >= 'a' && digit <= 'f' {
        return int(digit-'a') + 10
    }
    return -1
}

// Function to convert a hexadecimal string to a decimal number
func hexToDecimal(hex string) int {
    decimal := 0
    length := len(hex)
    for i := 0; i < length; i++ {
        digit := hexDigitToDecimal(rune(hex[i]))
        if digit == -1 {
            fmt.Println("Invalid hexadecimal digit:", string(hex[i]))
            return -1
        }
        decimal = decimal*16 + digit
    }
    return decimal
}

func main() {
    // Create a buffered reader to read input from the user
    reader := bufio.NewReader(os.Stdin)
    fmt.Print("Enter a hexadecimal number: ")

    // Read the input from the user
    hexInput, _ := reader.ReadString('\n')
    hexInput = strings.TrimSpace(hexInput)

    // Convert the hexadecimal input to a decimal number
    decimalOutput := hexToDecimal(hexInput)

    // Print the result
    if decimalOutput != -1 {
        fmt.Printf("The decimal equivalent of %s is %d\n", hexInput, decimalOutput)
    }
}

