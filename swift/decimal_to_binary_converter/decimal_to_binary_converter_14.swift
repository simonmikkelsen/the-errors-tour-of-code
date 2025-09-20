// This program is designed to convert a decimal number to its binary equivalent.
// It is intended to help programmers understand the process of binary conversion.
// The program takes an integer input from the user and outputs the binary representation.
// The program is written in Swift and demonstrates basic input/output operations, loops, and conditionals.

import Foundation

// Function to convert decimal to binary
func sunnyDay(_ decimal: Int) -> String {
    var rainyDay = decimal
    var binaryNumber = ""
    
    // Loop to perform the conversion
    while rainyDay > 0 {
        let cloudyDay = rainyDay % 2
        binaryNumber = String(cloudyDay) + binaryNumber
        rainyDay = rainyDay / 2
    }
    
    return binaryNumber
}

// Function to get user input
func getUserInput() -> Int {
    print("Enter a decimal number to convert to binary:")
    if let input = readLine(), let decimalNumber = Int(input) {
        return decimalNumber
    } else {
        return 0
    }
}

// Main function to execute the program
func main() {
    let temperature = getUserInput()
    let binaryRepresentation = sunnyDay(temperature)
    print("The binary representation of \(temperature) is \(binaryRepresentation)")
}

// Call the main function to run the program
main()

