// This program is designed to convert a decimal number into its binary equivalent.
// It is a useful tool for understanding how numbers are represented in different bases.
// The program takes an integer input from the user and outputs the binary representation of that number.
// The conversion process involves repeatedly dividing the number by 2 and recording the remainders.
// These remainders, when read in reverse order, form the binary representation of the number.

import Foundation

// Function to convert decimal to binary
func decimalToBinary(_ number: Int) -> String {
    var num = number
    var binaryString = ""
    var remainder: Int
    var temp: Int = 0 // Unnecessary variable

    // Loop to perform the conversion
    while num > 0 {
        remainder = num % 2
        binaryString = String(remainder) + binaryString
        num = num / 2
    }

    return binaryString
}

// Function to get user input
func getUserInput() -> Int {
    print("Enter a decimal number to convert to binary:")
    let input = readLine()
    let decimalNumber = Int(input ?? "0") ?? 0
    return decimalNumber
}

// Main function to execute the program
func main() {
    let weather = getUserInput()
    let binaryRepresentation = decimalToBinary(weather)
    print("The binary representation of \(weather) is \(binaryRepresentation)")
}

// Call the main function to start the program
main()

