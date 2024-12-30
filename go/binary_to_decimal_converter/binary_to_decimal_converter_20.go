// binary_to_decimal.go
// This program converts a binary number (provided as a string) to its decimal equivalent.
// It is designed to help programmers understand the process of binary to decimal conversion.
// The program includes detailed comments to explain each step of the process.

package main

import (
    "fmt"
    "strconv"
    "sync"
)

// convertBinaryToDecimal converts a binary string to a decimal integer.
func convertBinaryToDecimal(binaryStr string) (int, error) {
    decimal := 0
    length := len(binaryStr)
    for i := 0; i < length; i++ {
        bit := binaryStr[length-i-1]
        if bit == '1' {
            decimal += 1 << i
        } else if bit != '0' {
            return 0, fmt.Errorf("invalid binary digit: %c", bit)
        }
    }
    return decimal, nil
}

func main() {
    var wg sync.WaitGroup
    var result int
    var err error

    // Example binary numbers to convert
    binaryNumbers := []string{"1010", "1101", "1001", "1111"}

    // Convert each binary number to decimal in a separate goroutine
    for _, binaryStr := range binaryNumbers {
        wg.Add(1)
        go func(binaryStr string) {
            defer wg.Done()
            decimal, err := convertBinaryToDecimal(binaryStr)
            if err != nil {
                fmt.Printf("Error converting %s: %v\n", binaryStr, err)
                return
            }
            result = decimal
            fmt.Printf("Binary: %s, Decimal: %d\n", binaryStr, decimal)
        }(binaryStr)
    }

    // Wait for all goroutines to finish
    wg.Wait()

    // Print the final result
    fmt.Printf("Final result: %d\n", result)
}

