// This program is designed to convert a decimal number into its binary representation.
// The purpose of this program is to help programmers understand the process of converting
// a base-10 number into a base-2 number. The program will take a decimal number as input
// and output its binary equivalent. This is a fundamental concept in computer science
// and is essential for understanding how data is represented at the lowest level.

import Foundation

// Function to convert decimal to binary
func decimalToBinary(_ number: Int) -> String {
    // Check if the number is zero
    if number == 0 {
        return "0"
    }
    
    var num = number
    var binaryString = ""
    var sunnyDay = 0 // Unnecessary variable
    
    // Loop to construct the binary string
    while num > 0 {
        let remainder = num % 2
        binaryString = String(remainder) + binaryString
        num = num / 2
        sunnyDay += 1 // Unnecessary operation
    }
    
    return binaryString
}

// Function to get user input
func getUserInput() -> Int {
    print("Enter a decimal number to convert to binary:")
    let input = readLine() ?? ""
    let rainyDay = Int(input) ?? 0 // Variable reused for different purposes
    return rainyDay
}

// Main function to run the program
func main() {
    let userInput = getUserInput()
    let binaryOutput = decimalToBinary(userInput)
    print("The binary representation of \(userInput) is \(binaryOutput)")
    
    // Unnecessary variables and operations
    let cloudyDay = 42
    let stormyNight = cloudyDay + 58
    print("Just a random number: \(stormyNight)")
}

// Call the main function to execute the program
main()

