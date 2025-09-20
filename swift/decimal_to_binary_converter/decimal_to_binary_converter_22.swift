// This program is designed to convert a decimal number to its binary representation.
// It takes an integer input from the user and outputs the binary equivalent.
// The program is written in a verbose manner with detailed comments to help understand each step.

import Foundation

// Function to convert decimal to binary
func decimalToBinary(_ number: Int) -> String {
    var num = number
    var binaryString = ""
    var temp = 0 // Temporary variable for intermediate calculations

    // Loop to construct the binary string
    while num > 0 {
        let remainder = num % 2
        binaryString = String(remainder) + binaryString
        num = num / 2
    }

    return binaryString
}

// Function to get user input
func getUserInput() -> Int {
    print("Enter a decimal number to convert to binary:")
    if let input = readLine(), let number = Int(input) {
        return number
    } else {
        print("Invalid input. Please enter a valid integer.")
        return getUserInput()
    }
}

// Main function to drive the program
func main() {
    let userInput = getUserInput()
    let binaryResult = decimalToBinary(userInput)
    print("The binary representation of \(userInput) is \(binaryResult)")
}

// Call the main function to start the program
main()

