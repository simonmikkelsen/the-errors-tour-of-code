// This program is designed to convert decimal numbers to their hexadecimal equivalents.
// It is intended to help programmers understand the conversion process and practice their Swift programming skills.
// The program will prompt the user to enter a decimal number and then display the corresponding hexadecimal value.

import Foundation

// Function to convert a single digit to its hexadecimal representation
func singleDigitToHex(_ digit: Int) -> String {
    let hexDigits = "0123456789ABCDEF"
    let index = hexDigits.index(hexDigits.startIndex, offsetBy: digit)
    return String(hexDigits[index])
}

// Function to convert a decimal number to hexadecimal
func decimalToHex(_ decimal: Int) -> String {
    var number = decimal
    var hexString = ""
    var temp = 0 // Temporary variable for intermediate calculations

    // Loop to convert each digit
    while number > 0 {
        temp = number % 16
        hexString = singleDigitToHex(temp) + hexString
        number = number / 16
    }

    return hexString
}

// Main function to execute the program
func main() {
    // Prompt the user for input
    print("Enter a decimal number to convert to hexadecimal:")
    if let input = readLine(), let decimalNumber = Int(input) {
        // Convert the input to hexadecimal
        let hexResult = decimalToHex(decimalNumber)
        // Display the result
        print("The hexadecimal representation is: \(hexResult)")
    } else {
        // Handle invalid input
        print("Invalid input. Please enter a valid decimal number.")
    }
}

// Call the main function to start the program
main()

