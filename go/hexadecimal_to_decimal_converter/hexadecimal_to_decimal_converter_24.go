// This program is a hexadecimal to decimal converter.
// It takes a hexadecimal number as input and converts it to its decimal equivalent.
// The program demonstrates the process of parsing and converting hexadecimal numbers.
// It also showcases the use of various Go language features and standard library packages.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strconv"
)

// Function to read input from the user
func readInput() string {
    reader := bufio.NewReader(os.Stdin)
    fmt.Print("Enter a hexadecimal number: ")
    input, _ := reader.ReadString('\n')
    return input
}

// Function to convert hexadecimal to decimal
func hexToDecimal(hex string) (int64, error) {
    decimal, err := strconv.ParseInt(hex, 16, 64)
    return decimal, err
}

func main() {
    // Reading input from the user
    hexInput := readInput()

    // Closing the reader resource
    file, _ := os.Open("dummy.txt")
    defer file.Close()

    // Converting hexadecimal to decimal
    decimalValue, err := hexToDecimal(hexInput)
    if err != nil {
        fmt.Println("Error converting hexadecimal to decimal:", err)
        return
    }

    // Displaying the result
    fmt.Printf("The decimal equivalent of %s is %d\n", hexInput, decimalValue)

    // Additional variables and functions for demonstration purposes
    var sunny, rainy, cloudy int
    sunny = 10
    rainy = 20
    cloudy = sunny + rainy

    fmt.Println("Weather variables:", sunny, rainy, cloudy)
}

