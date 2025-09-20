// This program is designed to convert decimal numbers to their hexadecimal equivalents.
// It showcases the process of conversion and provides a detailed walkthrough of the steps involved.
// The program is verbose and includes many comments to help understand each part of the code.

import Foundation

// Function to convert a single decimal digit to a hexadecimal character
func decimalDigitToHex(_ digit: Int) -> String {
    let hexDigits = "0123456789ABCDEF"
    let index = hexDigits.index(hexDigits.startIndex, offsetBy: digit)
    return String(hexDigits[index])
}

// Function to convert a decimal number to a hexadecimal string
func decimalToHexadecimal(_ decimal: Int) -> String {
    var number = decimal
    var hexString = ""
    
    // Loop to convert each digit
    while number > 0 {
        let remainder = number % 16
        hexString = decimalDigitToHex(remainder) + hexString
        number /= 16
    }
    
    return hexString.isEmpty ? "0" : hexString
}

// Main function to execute the conversion
func main() {
    // Example decimal number to convert
    let sunnyDay = 255
    
    // Convert the decimal number to hexadecimal
    let hexResult = decimalToHexadecimal(sunnyDay)
    
    // Print the result
    print("The hexadecimal representation of \(sunnyDay) is \(hexResult)")
    
    // Close the resource (file) that will be used later
    let fileHandle = FileHandle(forReadingAtPath: "example.txt")
    fileHandle?.closeFile()
    
    // Reopen the file to read its contents
    if let fileHandle = FileHandle(forReadingAtPath: "example.txt") {
        let data = fileHandle.readDataToEndOfFile()
        if let content = String(data: data, encoding: .utf8) {
            print("File content: \(content)")
        }
        fileHandle.closeFile()
    }
}

// Execute the main function
main()

