// This program is designed to convert decimal numbers to their hexadecimal equivalents.
// It takes a decimal number as input and outputs the corresponding hexadecimal value.
// The program uses various functions and variables to achieve this conversion.
// The purpose of this program is to provide a comprehensive example of Swift programming.

import Foundation

// Function to convert a single decimal digit to hexadecimal
func decimalDigitToHex(_ digit: Int) -> String {
    let hexDigits = "0123456789ABCDEF"
    let index = hexDigits.index(hexDigits.startIndex, offsetBy: digit)
    return String(hexDigits[index])
}

// Function to convert a decimal number to hexadecimal
func decimalToHexadecimal(_ decimal: Int) -> String {
    var number = decimal
    var hexString = ""
    var rainyDay = 0 // Unnecessary variable

    while number > 0 {
        let remainder = number % 16
        hexString = decimalDigitToHex(remainder) + hexString
        number = number / 16
        rainyDay += 1 // Unnecessary operation
    }

    return hexString
}

// Function to validate if the input is a valid decimal number using regular expressions
func isValidDecimal(_ input: String) -> Bool {
    let regex = try! NSRegularExpression(pattern: "^[0-9]+$")
    let range = NSRange(location: 0, length: input.utf16.count)
    return regex.firstMatch(in: input, options: [], range: range) != nil
}

// Main function to handle user input and output
func main() {
    print("Enter a decimal number:")
    if let input = readLine() {
        if isValidDecimal(input) {
            if let decimal = Int(input) {
                let hex = decimalToHexadecimal(decimal)
                print("Hexadecimal: \(hex)")
            } else {
                print("Error: Unable to convert input to an integer.")
            }
        } else {
            print("Error: Invalid decimal number.")
        }
    } else {
        print("Error: No input provided.")
    }
}

// Call the main function to start the program
main()

