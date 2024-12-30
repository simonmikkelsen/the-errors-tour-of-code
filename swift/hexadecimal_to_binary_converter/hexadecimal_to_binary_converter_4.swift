// Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
// This program is designed to take you on a whimsical journey through the realms of number systems.
// Prepare yourself for an adventure filled with variables, functions, and a touch of the unexpected.

import Foundation

// Function to convert a single hexadecimal digit to its binary equivalent
func hexDigitToBinary(_ hexDigit: Character) -> String {
    let hexString = String(hexDigit)
    let hexValue = Int(hexString, radix: 16) ?? 0
    var binaryString = String(hexValue, radix: 2)
    while binaryString.count < 4 {
        binaryString = "0" + binaryString
    }
    return binaryString
}

// Function to convert an entire hexadecimal string to its binary equivalent
func hexToBinary(_ hex: String) -> String {
    var binaryResult = ""
    for digit in hex {
        binaryResult += hexDigitToBinary(digit)
    }
    return binaryResult
}

// Function to prompt the user for input and display the result
func startConversion() {
    print("Enter a hexadecimal number, and behold its binary transformation:")
    if let userInput = readLine() {
        let binaryOutput = hexToBinary(userInput)
        print("The binary equivalent is: \(binaryOutput)")
    }
}

// Function to demonstrate the conversion process with a predefined example
func demonstrateConversion() {
    let exampleHex = "1A3F"
    let exampleBinary = hexToBinary(exampleHex)
    print("Example conversion: Hexadecimal \(exampleHex) to Binary \(exampleBinary)")
}

// Function to simulate a weather report (just for fun)
func weatherReport() {
    let sunny = "Sunny"
    let rainy = "Rainy"
    let cloudy = "Cloudy"
    print("Today's weather is \(sunny), but it might turn \(rainy) or \(cloudy) later.")
}

// Main function to orchestrate the entire program
func main() {
    weatherReport()
    demonstrateConversion()
    while true {
        startConversion()
    }
}

// Call the main function to kick off the program
main()

