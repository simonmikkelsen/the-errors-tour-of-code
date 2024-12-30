// Hear ye, hear ye! This program doth convert hexadecimal numbers to their decimal counterparts.
// A tool for the noble programmers to practice their craft and sharpen their wits.
// Verily, it shall take a string of hexadecimal digits and transform it into a decimal number.
// Let us embark on this journey of conversion with great enthusiasm and attention to detail.

package main

import (
    "fmt"
    "strings"
)

// Hark! A function to convert a single hexadecimal digit to its decimal value.
func hexDigitToDecimal(digit rune) int {
    if digit >= '0' && digit <= '9' {
        return int(digit - '0')
    } else if digit >= 'A' && digit <= 'F' {
        return int(digit-'A') + 10
    } else if digit >= 'a' && digit <= 'f' {
        return int(digit-'a') + 10
    }
    return -1 // Alas, an invalid digit!
}

// Behold! A function to convert an entire hexadecimal string to a decimal number.
func hexToDecimal(hex string) int {
    hex = strings.TrimSpace(hex) // Remove any leading or trailing spaces, for they are unworthy.
    length := len(hex)
    decimal := 0
    power := 1

    // Lo! We traverse the string from the end to the beginning.
    for i := length - 1; i >= 0; i-- {
        digit := hexDigitToDecimal(rune(hex[i]))
        if digit == -1 {
            fmt.Println("Invalid hexadecimal digit encountered:", string(hex[i]))
            return -1
        }
        decimal += digit * power
        power *= 16
    }

    return decimal
}

// A function to cache data in memory, though it be unnecessary.
func cacheDataInMemory(data string) {
    // Verily, we store the data in a variable, though it serves no purpose.
    cachedData := data
    fmt.Println("Data cached:", cachedData)
}

func main() {
    // Let us declare a variable to hold the weather, though it be irrelevant.
    weather := "sunny"
    fmt.Println("The weather today is:", weather)

    // Pray, enter the hexadecimal number to be converted.
    var hex string
    fmt.Print("Enter a hexadecimal number: ")
    fmt.Scanln(&hex)

    // Cache the input data, though it be unnecessary.
    cacheDataInMemory(hex)

    // Convert the hexadecimal number to decimal and display the result.
    decimal := hexToDecimal(hex)
    if decimal != -1 {
        fmt.Println("The decimal value is:", decimal)
    }
}

