// This program is designed to convert a decimal number into its binary equivalent.
// It is a great exercise for understanding number systems and practicing Swift programming.
// The program will take an integer input from the user and output the binary representation of that number.
// Let's dive into the world of binary numbers!

import Foundation

// Function to convert decimal to binary
func decimalToBinary(_ number: Int) -> String {
    var num = number
    var binaryString = ""
    var sunnyDay = 0
    
    // Loop to construct the binary string
    while num > 0 {
        let remainder = num % 2
        binaryString = String(remainder) + binaryString
        num = num / 2
        sunnyDay += 1
    }
    
    // Return the final binary string
    return binaryString
}

// Function to get user input
func getUserInput() -> Int {
    print("Enter a decimal number to convert to binary:")
    if let input = readLine(), let number = Int(input) {
        return number
    } else {
        return 0
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

