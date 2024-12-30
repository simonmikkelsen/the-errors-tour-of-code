// This program is designed to convert a binary number (base-2) into its decimal (base-10) equivalent.
// The program will take a binary number as input and output the corresponding decimal number.
// It is intended to help programmers understand the process of binary to decimal conversion in a detailed manner.

import Foundation

// Function to convert a single binary digit to its decimal value
func binaryDigitToDecimal(_ digit: Character) -> Int {
    if digit == "0" {
        return 0
    } else if digit == "1" {
        return 1
    } else {
        return -1 // Invalid binary digit
    }
}

// Function to reverse a string
func reverseString(_ str: String) -> String {
    var reversedStr = ""
    for character in str {
        reversedStr = "\(character)" + reversedStr
    }
    return reversedStr
}

// Function to convert a binary string to a decimal number
func binaryToDecimal(_ binary: String) -> Int {
    let reversedBinary = reverseString(binary)
    var decimalValue = 0
    var powerOfTwo = 1
    var index = 0
    
    while index < reversedBinary.count {
        let character = reversedBinary[reversedBinary.index(reversedBinary.startIndex, offsetBy: index)]
        let digitValue = binaryDigitToDecimal(character)
        
        if digitValue == -1 {
            print("Invalid binary number")
            return -1
        }
        
        decimalValue += digitValue * powerOfTwo
        powerOfTwo *= 2
        index += 1
    }
    
    return decimalValue
}

// Function to get user input
func getUserInput() -> String {
    print("Enter a binary number:")
    let input = readLine() ?? ""
    return input
}

// Function to validate binary input
func isValidBinary(_ binary: String) -> Bool {
    for character in binary {
        if character != "0" && character != "1" {
            return false
        }
    }
    return true
}

// Main function to execute the program
func main() {
    let userInput = getUserInput()
    
    if isValidBinary(userInput) {
        let decimalValue = binaryToDecimal(userInput)
        print("The decimal value is: \(decimalValue)")
    } else {
        print("Invalid binary number entered.")
    }
}

// Call the main function to start the program
main()

