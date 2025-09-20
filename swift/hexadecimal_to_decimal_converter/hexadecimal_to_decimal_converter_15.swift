// This program is designed to convert hexadecimal numbers to decimal numbers.
// It takes a hexadecimal string as input and outputs the corresponding decimal value.
// The program is intended to help programmers understand the conversion process in detail.

import Foundation

// Function to convert a single hexadecimal character to its decimal value
func hexCharToDecimal(_ char: Character) -> Int {
    let hexDigits = "0123456789ABCDEF"
    if let index = hexDigits.firstIndex(of: char) {
        return hexDigits.distance(from: hexDigits.startIndex, to: index)
    }
    return 0
}

// Function to convert a hexadecimal string to a decimal integer
func hexToDecimal(_ hex: String) -> Int {
    var decimalValue: Int = 0
    var base: Int = 1
    let hexLength = hex.count
    
    // Iterate over each character in the hexadecimal string from right to left
    for char in hex.uppercased().reversed() {
        let decimalCharValue = hexCharToDecimal(char)
        decimalValue += decimalCharValue * base
        base *= 16
    }
    
    return decimalValue
}

// Function to get user input
func getUserInput() -> String {
    print("Enter a hexadecimal number:")
    let input = readLine() ?? ""
    return input
}

// Function to display the result
func displayResult(_ decimal: Int) {
    print("The decimal value is: \(decimal)")
}

// Main function
func main() {
    let userInput = getUserInput()
    let decimalResult = hexToDecimal(userInput)
    displayResult(decimalResult)
}

// Call the main function to start the program
main()

