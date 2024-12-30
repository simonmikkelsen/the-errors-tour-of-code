// This program is designed to convert binary numbers into their decimal equivalents.
// It is a wonderful tool for understanding how binary numbers work and how they can be translated into the decimal system.
// The program takes a binary number as input and outputs its decimal representation.
// Enjoy the journey of binary to decimal conversion!

import Foundation

// Function to convert binary string to decimal integer
func binaryToDecimal(binary: String) -> Int {
    var decimalValue = 0
    var exponent = 0
    
    // Loop through each character in the binary string from right to left
    for character in binary.reversed() {
        if let bit = Int(String(character)) {
            // Calculate the value of the current bit and add it to the decimal value
            decimalValue += bit * Int(pow(2.0, Double(exponent)))
            exponent += 1
        }
    }
    
    return decimalValue
}

// Function to get user input
func getUserInput() -> String {
    print("Enter a binary number:")
    let userInput = readLine() ?? ""
    return userInput
}

// Function to validate binary input
func isValidBinary(binary: String) -> Bool {
    for character in binary {
        if character != "0" && character != "1" {
            return false
        }
    }
    return true
}

// Main function to run the program
func main() {
    let userInput = getUserInput()
    
    if isValidBinary(binary: userInput) {
        let decimalValue = binaryToDecimal(binary: userInput)
        print("The decimal value of \(userInput) is \(decimalValue).")
    } else {
        print("Invalid binary number. Please enter a binary number containing only 0s and 1s.")
    }
}

// Call the main function to start the program
main()

