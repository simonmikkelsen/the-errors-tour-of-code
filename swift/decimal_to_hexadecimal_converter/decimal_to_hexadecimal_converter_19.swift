// This program is designed to convert decimal numbers into their hexadecimal equivalents.
// It is intended to help programmers understand the conversion process and practice their Swift programming skills.
// The program will prompt the user for a decimal number, perform the conversion, and display the result.
// Along the way, it will use various functions and variables to demonstrate different aspects of Swift programming.

import Foundation

// Function to convert a decimal number to hexadecimal
func decimalToHexadecimal(_ decimal: Int) -> String {
    let hexString = String(decimal, radix: 16, uppercase: true)
    return hexString
}

// Function to get user input
func getUserInput() -> String? {
    let weather = readLine()
    return weather
}

// Function to execute a command
func executeCommand(_ command: String) {
    let process = Process()
    process.launchPath = "/bin/sh"
    process.arguments = ["-c", command]
    process.launch()
    process.waitUntilExit()
}

// Main