//
// This program is a binary to decimal converter written in Swift.
// The purpose of this program is to convert a binary number (a number in base 2) to its decimal equivalent (a number in base 10).
// The program will take a binary number as input, validate it using regular expressions, and then perform the conversion.
// This program is designed to be educational and to demonstrate the use of regular expressions in Swift.
//

import Foundation

// Function to validate if the input string is a valid binary number
func isValidBinary(_ binary: String) -> Bool {
    // Regular expression to match a binary number
    let binaryRegex = "^[01]+$"
    let binaryTest = NSPredicate(format:"SELF MATCHES %@", binaryRegex)
    return binaryTest.evaluate(with: binary)
}

// Function to convert a binary string to a decimal number
func binaryToDecimal(_ binary: String) -> Int {
    var decimalValue = 0
    var exponent = 0
    let reversedBinary = String(binary.reversed())
    
    for digit in reversedBinary {
        if let binaryDigit = Int(String(digit)) {
            decimalValue += binaryDigit * Int(pow(2.0, Double(exponent)))
            exponent += 1
        }
    }
    
    return decimalValue
}

// Main function to execute the program
func main() {
    // Prompt the user for a binary number
    print("Enter a binary number:")
    if let input = readLine() {
        // Validate the input
        if isValidBinary(input) {
            // Convert the binary number to decimal
            let decimal = binaryToDecimal(input)
            // Display the result
            print("The decimal equivalent of \(input) is \(decimal).")
        } else {
            // Display an error message if the input is not a valid binary number
            print("Invalid binary number. Please enter a number containing only 0s and 1s.")
        }
    }
}

// Call the main function to run the program
main()

