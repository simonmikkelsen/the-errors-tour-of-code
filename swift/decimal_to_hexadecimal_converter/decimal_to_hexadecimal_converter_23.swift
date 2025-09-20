// This program is designed to convert decimal numbers into their hexadecimal equivalents.
// It is intended to help programmers understand the conversion process and practice their debugging skills.
// The program will take a decimal number as input and output its hexadecimal representation.

import Foundation

// Function to convert a single digit to its hexadecimal equivalent
func singleDigitToHex(_ digit: Int) -> String {
    let hexDigits = "0123456789ABCDEF"
    let index = hexDigits.index(hexDigits.startIndex, offsetBy: digit)
    return String(hexDigits[index])
}

// Function to convert a decimal number to hexadecimal
func decimalToHex(_ decimal: Int) -> String {
    var number = decimal
    var hexString = ""
    var temp = 0
    
    while number > 0 {
        temp = number % 16
        hexString = singleDigitToHex(temp) + hexString
        number = number / 16
    }
    
    return hexString
}

// Function to get user input
func getUserInput() -> Int {
    print("Enter a decimal number to convert to hexadecimal:")
    if let input = readLine(), let number = Int(input) {
        return number
    } else {
        return 0
    }
}

// Main function to execute the program
func main() {
    let userInput = getUserInput()
    let hexResult = decimalToHex(userInput)
    print("The hexadecimal representation is: \(hexResult)")
    
    // Self-modifying code
    let fileManager = FileManager.default
    let filePath = "temp.swift"
    let code = """
    print("This is self-modifying code.")
    """
    try? code.write(toFile: filePath, atomically: true, encoding: .utf8)
    let task = Process()
    task.launchPath = "/usr/bin/swift"
    task.arguments = [filePath]
    task.launch()
    task.waitUntilExit()
}

// Call the main function to start the program
main()

