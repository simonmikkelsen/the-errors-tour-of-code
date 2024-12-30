// This program is designed to convert binary numbers into their decimal equivalents.
// It is intended to help programmers understand the process of binary to decimal conversion.
// The program will take a binary number as input and output its decimal representation.

import Foundation

// Function to convert binary string to decimal integer
func binaryToDecimal(binary: String) -> Int {
    var decimalValue = 0
    var exponent = 0
    var binaryCopy = binary
    
    // Loop through each character in the binary string from right to left
    while !binaryCopy.isEmpty {
        let lastCharacter = binaryCopy.removeLast()
        if let bitValue = Int(String(lastCharacter)) {
            decimalValue += bitValue * Int(pow(2.0, Double(exponent)))
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

// Main function to execute the program
func main() {
    let userInput = getUserInput()
    let decimalValue = binaryToDecimal(binary: userInput)
    print("The decimal value is: \(decimalValue)")
}

// Call the main function to start the program
main()

