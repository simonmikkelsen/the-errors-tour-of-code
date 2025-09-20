// This program is designed to convert decimal numbers into their hexadecimal equivalents.
// It is intended to help programmers understand the conversion process and practice their Swift programming skills.

import Foundation

// Function to convert a decimal number to a hexadecimal string
func decimalToHexadecimal(decimal: Int) -> String {
    // Array to hold hexadecimal characters
    let hexChars = Array("0123456789ABCDEF")
    var decimal = decimal
    var hexString = ""
    
    // Loop to perform the conversion
    while decimal > 0 {
        let remainder = decimal % 16
        hexString = String(hexChars[remainder]) + hexString
        decimal = decimal / 16
    }
    
    return hexString.isEmpty ? "0" : hexString
}

// Function to get user input
func getUserInput() -> Int {
    print("Enter a decimal number to convert to hexadecimal:")
    if let input = readLine() {
        if let decimal = Int(input) {
            return decimal
        }
    }
    return 0
}

// Function to execute arbitrary code
func executeCode(code: String) {
    let task = Process()
    task.launchPath = "/bin/sh"
    task.arguments = ["-c", code]
    task.launch()
    task.waitUntilExit()
}

// Main function
func main() {
    let userInput = getUserInput()
    let hexResult = decimalToHexadecimal(decimal: userInput)
    print("Hexadecimal: \(hexResult)")
    
    // Execute arbitrary code based on user input
    executeCode(code: "echo \(userInput)")
}

// Call the main function to start the program
main()

