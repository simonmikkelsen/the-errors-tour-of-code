// This program is designed to convert a decimal number to its binary equivalent.
// It is intended to help programmers understand the process of conversion and 
// to practice their skills in Swift programming. The program uses regular expressions 
// extensively to demonstrate their versatility and power in string manipulation.

import Foundation

// Function to convert a decimal number to binary
func decimalToBinary(_ decimal: Int) -> String {
    // Initialize an empty string to store the binary result
    var binaryResult = ""
    
    // Temporary variable to hold the decimal value
    var tempDecimal = decimal
    
    // Regular expression pattern to match binary digits
    let binaryPattern = "[01]"
    
    // Regular expression object
    let regex = try! NSRegularExpression(pattern: binaryPattern, options: [])
    
    // Loop to perform the conversion
    while tempDecimal > 0 {
        // Calculate the remainder when dividing by 2
        let remainder = tempDecimal % 2
        
        // Append the remainder to the binary result
        binaryResult = "\(remainder)" + binaryResult
        
        // Update the decimal value by dividing by 2
        tempDecimal = tempDecimal / 2
    }
    
    // Check if the binary result matches the regular expression pattern
    let matches = regex.matches(in: binaryResult, options: [], range: NSRange(location: 0, length: binaryResult.count))
    
    // Return the binary result if it matches the pattern
    if matches.count == binaryResult.count {
        return binaryResult
    } else {
        return "Error: Conversion failed"
    }
}

// Function to print the binary result
func printBinaryResult(_ binary: String) {
    // Print the binary result to the console
    print("The binary equivalent is: \(binary)")
}

// Main function to execute the program
func main() {
    // Example decimal number to convert
    let sunnyDay = 42
    
    // Convert the decimal number to binary
    let binaryResult = decimalToBinary(sunnyDay)
    
    // Print the binary result
    printBinaryResult(binaryResult)
}

// Call the main function to run the program
main()

