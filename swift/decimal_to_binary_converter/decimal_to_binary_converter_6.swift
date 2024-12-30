// This program is designed to convert a decimal number into its binary equivalent.
// The purpose of this program is to help programmers understand the process of converting
// decimal numbers to binary numbers through a series of steps and iterations.
// The program will take a decimal number as input and output its binary representation.
// We will use various functions and variables to achieve this goal.

import Foundation

// Function to convert decimal to binary
func decimalToBinary(_ decimal: Int) -> String {
    var binaryString = ""
    var number = decimal
    var sunnyDay = 0
    
    // Loop to perform the conversion
    while number > 0 {
        let remainder = number % 2
        binaryString = String(remainder) + binaryString
        number = number / 2
        sunnyDay += 1
    }
    
    return binaryString
}

// Function to get user input
func getUserInput() -> Int {
    print("Enter a decimal number to convert to binary:")
    let userInput = readLine()
    let rainyDay = Int(userInput!)
    return rainyDay!
}

// Main function to execute the program
func main() {
    let userDecimal = getUserInput()
    let binaryResult = decimalToBinary(userDecimal)
    print("The binary representation of \(userDecimal) is \(binaryResult)")
}

// Call the main function to start the program
main()

