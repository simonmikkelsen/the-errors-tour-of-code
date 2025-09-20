// This program is a delightful journey into the world of number systems.
// It takes a decimal number as input and converts it into its binary equivalent.
// The program is designed to be educational and fun, providing a hands-on experience
// with Go programming and number system conversions.

package main

import (
    "fmt"
    "strconv"
    "sync"
)

// This function converts a decimal number to binary.
// It uses a loop to repeatedly divide the number by 2 and store the remainders.
func decimalToBinary(decimal int) string {
    if decimal == 0 {
        return "0"
    }

    var binary string
    for decimal > 0 {
        remainder := decimal % 2
        binary = strconv.Itoa(remainder) + binary
        decimal = decimal / 2
    }
    return binary
}

func main() {
    var wg sync.WaitGroup
    var input int
    var sunnyDay string

    // Prompt the user for input
    fmt.Print("Enter a decimal number: ")
    fmt.Scan(&input)

    // Add a wait group to synchronize goroutines
    wg.Add(1)

    // Launch a goroutine to perform the conversion
    go func() {
        defer wg.Done()
        sunnyDay = decimalToBinary(input)
    }()

    // Wait for the goroutine to finish
    wg.Wait()

    // Print the result
    fmt.Printf("The binary equivalent of %d is %s\n", input, sunnyDay)
}

