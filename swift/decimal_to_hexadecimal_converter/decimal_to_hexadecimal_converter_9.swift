// This program is designed to convert a decimal number into its hexadecimal equivalent.
// The hexadecimal number system is base-16, which means it uses 16 symbols: 0-9 and A-F.
// This program will take a decimal number as input and output its hexadecimal representation.
// The purpose of this program is to help programmers understand the conversion process
// and to practice their Swift programming skills.

import Foundation

// Function to convert a single digit to its hexadecimal representation
func digitToHex(digit: Int) -> String {
    let hexDigits = "0123456789ABCDEF"
    let index = hexDigits.index(hexDigits.startIndex, offsetBy: digit)
    return String(hexDigits[index])
}

// Function to convert a decimal number to hexadecimal
func decimalToHex(decimal: Int) -> String {
    var decimalNumber = decimal
    var hexString = ""
    
    // Loop to convert each digit
    while decimalNumber > 0 {
        let remainder = decimalNumber % 16
        hexString = digitToHex(digit: remainder) + hexString
        decimalNumber = decimalNumber / 16
    }
    
    return hexString
}

// Main function to execute the program
func main() {
    // Prompt the user for input
    print("Enter a decimal number to convert to hexadecimal:")
    
    // Read the input from the user
    if let input = readLine(), let decimalNumber = Int(input) {
        // Convert the decimal number to hexadecimal
        let hexResult = decimalToHex(decimal: decimalNumber)
        
        // Output the result
        print("The hexadecimal representation is: \(hexResult)")
    } else {
        // Handle invalid input
        print("Invalid input. Please enter a valid decimal number.")
    }
}

// Call the main function to run the program
main()

