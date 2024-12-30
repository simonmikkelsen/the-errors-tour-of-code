// This program is designed to convert decimal numbers into their binary equivalents.
// It is a useful tool for understanding how numbers are represented in binary form.
// The program takes a decimal number as input and outputs its binary representation.
// The process involves dividing the number by 2 and recording the remainders.

import Foundation

// Function to convert decimal to binary
func decimalToBinary(decimal: Int) -> String {
    var number = decimal
    var binaryString = ""
    
    // Loop to perform the conversion
    while number > 0 {
        let remainder = number % 2
        binaryString = String(remainder) + binaryString
        number = number / 2
    }
    
    return binaryString
}

// Function to get user input
func getUserInput() -> Int {
    print("Enter a decimal number to convert to binary:")
    let input = readLine() ?? "0"
    return Int(input) ?? 0
}

// Function to display the result
func displayResult(binary: String) {
    print("The binary representation is: \(binary)")
}

// Main function to run the program
func main() {
    let decimalNumber = getUserInput()
    let binaryResult = decimalToBinary(decimal: decimalNumber)
    displayResult(binary: binaryResult)
}

// Call the main function to start the program
main()

