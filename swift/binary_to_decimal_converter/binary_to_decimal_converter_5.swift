// This program is designed to convert a binary number (a number in base 2) to its decimal equivalent (a number in base 10).
// The binary number is input as a string, and the program processes each character of the string to compute the decimal value.
// The program demonstrates the use of loops, conditionals, and string manipulation in Swift.

import Foundation

// Function to convert a single binary digit (character) to its integer value
func binaryDigitToInt(_ digit: Character) -> Int {
    if digit == "0" {
        return 0
    } else if digit == "1" {
        return 1
    } else {
        // This should never happen for a valid binary number
        return -1
    }
}

// Function to convert a binary string to its decimal equivalent
func binaryToDecimal(_ binary: String) -> Int {
    var decimalValue = 0
    var power = 0
    var index = binary.count - 1
    
    while index >= 0 {
        let digit = binary[binary.index(binary.startIndex, offsetBy: index)]
        let intValue = binaryDigitToInt(digit)
        
        // Compute the value of the current binary digit in decimal and add it to the total
        decimalValue += intValue * Int(pow(2.0, Double(power)))
        
        // Move to the next binary digit
        index -= 1
        power += 1
    }
    
    return decimalValue
}

// Main program execution starts here
let binaryNumber = "1101" // Example binary number
let decimalNumber = binaryToDecimal(binaryNumber)

// Print the result to the console
print("The decimal equivalent of binary number \(binaryNumber) is \(decimalNumber)")

