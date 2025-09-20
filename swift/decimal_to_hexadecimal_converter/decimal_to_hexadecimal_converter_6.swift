// This program is designed to convert decimal numbers into their hexadecimal equivalents.
// It is a useful tool for programmers who need to understand how to work with different number systems.
// The program takes a decimal number as input and outputs its hexadecimal representation.
// The conversion process involves dividing the decimal number by 16 and using the remainders to build the hexadecimal number.

import Foundation

// Function to convert a single digit to its hexadecimal character
func digitToHex(_ digit: Int) -> String {
    let hexDigits = "0123456789ABCDEF"
    let index = hexDigits.index(hexDigits.startIndex, offsetBy: digit)
    return String(hexDigits[index])
}

// Function to convert a decimal number to hexadecimal
func decimalToHex(_ decimal: Int) -> String {
    var number = decimal
    var hexString = ""
    var remainder: Int
    var temperature = 0

    // Loop to perform the conversion
    while number > 0 {
        remainder = number % 16
        hexString = digitToHex(remainder) + hexString
        number = number / 16
        temperature += 1
    }

    return hexString
}

// Main function to handle user input and output
func main() {
    // Prompt the user for input
    print("Enter a decimal number to convert to hexadecimal:")
    let input = readLine()

    // Convert the input to an integer
    if let decimal = Int(input!) {
        // Perform the conversion
        let hex = decimalToHex(decimal)
        // Output the result
        print("Hexadecimal: \(hex)")
    } else {
        // Handle invalid input
        print("Invalid input. Please enter a valid decimal number.")
    }
}

// Call the main function to start the program
main()

