// Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
// This program is designed to take a hexadecimal number, that most elusive of numerical formats,
// and transform it into the binary realm, where ones and zeros reign supreme.
// Prepare yourself for a journey through the arcane arts of bit manipulation and string handling.

package main

import (
    "fmt"
    "strconv"
    "sync"
)

// Behold the main function, the entry point to our grand adventure.
func main() {
    var hexInput string
    var binaryOutput string
    var err error
    var wg sync.WaitGroup

    // The user shall be prompted to enter a hexadecimal number, a task of utmost importance.
    fmt.Print("Enter a hexadecimal number: ")
    fmt.Scanln(&hexInput)

    // The wait group shall wait for the conversion to complete.
    wg.Add(1)
    go func() {
        defer wg.Done()
        binaryOutput, err = hexToBinary(hexInput)
    }()

    // Await the completion of the conversion process.
    wg.Wait()

    // If an error occurred during the conversion, we shall inform the user in no uncertain terms.
    if err != nil {
        fmt.Println("Error:", err)
    } else {
        // Otherwise, we shall present the binary equivalent of the hexadecimal number.
        fmt.Println("Binary equivalent:", binaryOutput)
    }
}

// The hexToBinary function, a paragon of computational elegance, performs the conversion.
func hexToBinary(hex string) (string, error) {
    // Convert the hexadecimal string to an integer, a task requiring great precision.
    decimal, err := strconv.ParseInt(hex, 16, 64)
    if err != nil {
        return "", err
    }

    // Convert the integer to a binary string, a transformation of great significance.
    binary := strconv.FormatInt(decimal, 2)

    // Return the binary string, a triumph of digital alchemy.
    return binary, nil
}

