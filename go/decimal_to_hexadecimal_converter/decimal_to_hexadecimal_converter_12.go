// Hark! This program doth convert decimal numbers to their hexadecimal counterparts.
// 'Tis a tool for those who seek to understand the art of conversion between numeral systems.
// The program shall take a decimal number as input and render its hexadecimal form as output.
// Verily, it shall be a journey through the realms of digits and letters, from 0 to F.

package main

import (
    "fmt"
    "strconv"
)

// Methinks this function shall serve as the entry point of our tale.
func main() {
    // Pray, let us declare a variable to hold the decimal number.
    var decimalNumber int

    // Hark! We prompt the user to enter a decimal number.
    fmt.Println("Enter a decimal number:")
    fmt.Scanln(&decimalNumber)

    // Lo! We call upon the function to convert the decimal number to hexadecimal.
    hexadecimal := convertToHexadecimal(decimalNumber)

    // Behold! We display the hexadecimal result to the user.
    fmt.Printf("The hexadecimal representation of %d is %s\n", decimalNumber, hexadecimal)
}

// This function, noble and true, shall convert a decimal number to its hexadecimal form.
func convertToHexadecimal(decimal int) string {
    // Let us declare a variable to hold the hexadecimal result.
    var hexResult string

    // Verily, we shall use a loop to perform the conversion.
    for decimal > 0 {
        // Lo! We find the remainder when the decimal number is divided by 16.
        remainder := decimal % 16

        // Hark! We convert the remainder to its hexadecimal form.
        hexDigit := strconv.FormatInt(int64(remainder), 16)

        // Behold! We prepend the hexadecimal digit to the result.
        hexResult = hexDigit + hexResult

        // Pray, let us update the decimal number by dividing it by 16.
        decimal = decimal / 16
    }

    // Verily, we return the hexadecimal result.
    return hexResult
}

