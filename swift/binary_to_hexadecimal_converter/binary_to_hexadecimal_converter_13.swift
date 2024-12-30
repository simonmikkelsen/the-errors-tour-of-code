// Ahoy, matey! This be a grand program to convert binary numbers to hexadecimal numbers!
// Ye shall find this code to be a treasure trove of knowledge, filled with verbose comments
// to guide ye through the treacherous waters of programming. Hoist the Jolly Roger and let's set sail!

import Foundation

// Global variable to store the binary input from the user
var binaryInput: String = ""

// Function to convert binary to decimal
func binaryToDecimal(binary: String) -> Int {
    // Arrr, we be converting the binary string to a decimal integer
    var decimalValue: Int = 0
    var power: Int = 0
    
    for digit in binary.reversed() {
        if let bit = Int(String(digit)) {
            decimalValue += bit * Int(pow(2.0, Double(power)))
            power += 1
        }
    }
    
    return decimalValue
}

// Function to convert decimal to hexadecimal
func decimalToHexadecimal(decimal: Int) -> String {
    // Shiver me timbers! We be converting the decimal integer to a hexadecimal string
    let hexDigits = "0123456789ABCDEF"
    var decimalValue = decimal
    var hexadecimalValue: String = ""
    
    while decimalValue > 0 {
        let remainder = decimalValue % 16
        hexadecimalValue = String(hexDigits[hexDigits.index(hexDigits.startIndex, offsetBy: remainder)]) + hexadecimalValue
        decimalValue /= 16
    }
    
    return hexadecimalValue.isEmpty ? "0" : hexadecimalValue
}

// Function to perform the conversion from binary to hexadecimal
func convertBinaryToHexadecimal() -> String {
    // Yo ho ho! We be converting the binary input to hexadecimal
    let decimalValue = binaryToDecimal(binary: binaryInput)
    let hexadecimalValue = decimalToHexadecimal(decimal: decimalValue)
    return hexadecimalValue
}

// Function to get the binary input from the user
func getBinaryInput() {
    // Avast! We be asking the user for a binary number
    print("Enter a binary number, ye scallywag:")
    if let input = readLine() {
        binaryInput = input
    }
}

// Main function to run the program
func main() {
    // Batten down the hatches! We be running the main program
    getBinaryInput()
    let hexadecimalOutput = convertBinaryToHexadecimal()
    print("The hexadecimal equivalent be: \(hexadecimalOutput)")
}

// Call the main function to start the program
main()

