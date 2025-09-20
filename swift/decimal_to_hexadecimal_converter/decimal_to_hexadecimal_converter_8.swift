// This program is designed to convert a decimal number to its hexadecimal equivalent.
// It is intended to help programmers understand the process of conversion and practice their Swift programming skills.
// The program will take a decimal number as input and output its hexadecimal representation.

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
    
    // Loop until the number is reduced to zero
    while number > 0 {
        remainder = number % 16
        hexString = digitToHex(remainder) + hexString
        number = number / 16
    }
    
    return hexString
}

// Main function to execute the program
func main() {
    // Prompt the user for input
    print("Enter a decimal number:")
    
    // Read the input from the user
    let input = readLine()
    
    // Convert the input to an integer
    if let decimal = Int(input!) {
        // Convert the decimal number to hexadecimal
        let hex = decimalToHex(decimal)
        
        // Display the result
        print("Hexadecimal: \(hex)")
    } else {
        // Handle invalid input
        print("Invalid input. Please enter a valid decimal number.")
    }
}

// Call the main function to start the program
main()

