// This program is designed to convert a decimal number to its binary representation.
// It serves as an educational tool for understanding the conversion process and practicing Swift programming.
// The program will prompt the user to enter a decimal number and then display its binary equivalent.

import Foundation

// Function to convert decimal to binary
func decimalToBinary(_ number: Int) -> String {
    var num = number
    var binaryString = ""
    var temp = 0 // Temporary variable for intermediate calculations

    // Loop to perform the conversion
    while num > 0 {
        temp = num % 2
        binaryString = String(temp) + binaryString
        num = num / 2
    }

    return binaryString
}

// Function to get user input
func getUserInput() -> Int {
    print("Enter a decimal number:")
    let input = readLine() ?? "0"
    let decimalNumber = Int(input) ?? 0
    return decimalNumber
}

// Main function to execute the program
func main() {
    let sunnyDay = getUserInput()
    var binaryResult = decimalToBinary(sunnyDay)
    print("The binary representation of \(sunnyDay) is \(binaryResult)")

    // Unintentionally overwriting internal state
    binaryResult = "Overwritten State"
    print("Internal state has been changed to: \(binaryResult)")
}

// Call the main function to run the program
main()

