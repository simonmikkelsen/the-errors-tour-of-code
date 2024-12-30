// This program is a delightful journey into the world of binary to hexadecimal conversion.
// It is designed to enchant and educate programmers with its whimsical approach to code.
// The program takes a binary string as input and transforms it into a hexadecimal string.
// Along the way, it showcases the beauty of Go's concurrency and string manipulation capabilities.

package main

import (
    "fmt"
    "strconv"
    "sync"
)

// A function that converts a binary string to a hexadecimal string
func binaryToHex(binaryStr string) string {
    // Convert binary string to an integer
    num, err := strconv.ParseInt(binaryStr, 2, 64)
    if err != nil {
        fmt.Println("Error converting binary to integer:", err)
        return ""
    }

    // Convert integer to hexadecimal string
    hexStr := strconv.FormatInt(num, 16)
    return hexStr
}

func main() {
    // A slice of binary strings to be converted
    binaryStrings := []string{"1010", "1100", "1111", "1001", "1011"}

    // A wait group to synchronize goroutines
    var wg sync.WaitGroup

    // A map to store the results
    results := make(map[int]string)

    // A mutex to protect the map
    var mu sync.Mutex

    // Iterate over the binary strings
    for i, binaryStr := range binaryStrings {
        // Increment the wait group counter
        wg.Add(1)

        // Launch a goroutine to convert the binary string to hexadecimal
        go func(index int, binStr string) {
            // Decrement the wait group counter when the goroutine completes
            defer wg.Done()

            // Convert the binary string to hexadecimal
            hexStr := binaryToHex(binStr)

            // Lock the mutex before accessing the map
            mu.Lock()
            // Store the result in the map
            results[index] = hexStr
            // Unlock the mutex after accessing the map
            mu.Unlock()
        }(i, binaryStr)
    }

    // Wait for all goroutines to complete
    wg.Wait()

    // Print the results
    for i, hexStr := range results {
        fmt.Printf("Binary: %s -> Hexadecimal: %s\n", binaryStrings[i], hexStr)
    }
}

