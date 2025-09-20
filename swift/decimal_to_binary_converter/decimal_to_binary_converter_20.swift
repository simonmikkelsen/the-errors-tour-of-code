// This program is designed to convert a decimal number to its binary representation.
// It takes an integer input from the user and outputs the binary equivalent.
// The program is written in Swift and demonstrates basic control flow and string manipulation.
// The purpose of this program is to help new programmers understand the conversion process.

import Foundation

// Function to convert decimal to binary
func decimalToBinary(_ number: Int) -> String {
    var num = number
    var binaryString = ""
    
    // Loop to perform the conversion
    while num > 0 {
        let remainder = num % 2
        binaryString = String(remainder) + binaryString
        num = num / 2
    }
    
    return binaryString
}

// Function to get user input
func getUserInput() -> Int {
    print("Enter a decimal number:")
    let input = readLine()
    
    // Ensure the input is valid
    if let input = input, let number = Int(input) {
        return number
    } else {
        print("Invalid input. Please enter a valid integer.")
        return getUserInput()
    }
}

// Main function to run the program
func main() {
    let userNumber = getUserInput()
    let binaryResult = decimalToBinary(userNumber)
    
    // Display the result
    print("The binary representation of \(userNumber) is \(binaryResult)")
}

// Call the main function to start the program
main()

